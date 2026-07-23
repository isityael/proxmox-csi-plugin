package proxmoxcsiplugin_test

import (
	"encoding/json"
	"os"
	"strings"
	"testing"
)

func TestDirectDependenciesAvoidReplacedOrDeprecatedModules(t *testing.T) {
	data, err := os.ReadFile("go.mod")
	if err != nil {
		t.Fatalf("read go.mod: %v", err)
	}

	banned := map[string]string{
		"github.com/golang/protobuf":     "use google.golang.org/protobuf",
		"github.com/patrickmn/go-cache":  "use local or maintained TTL cache code",
		"github.com/pkg/errors":          "use the standard library errors package",
		"github.com/siderolabs/go-retry": "use local retry code for simple polling",
		"gopkg.in/yaml.v3":               "use go.yaml.in/yaml/v3",
	}

	for _, line := range strings.Split(string(data), "\n") {
		line = strings.TrimSpace(line)
		if line == "" || strings.HasPrefix(line, "//") {
			continue
		}
		if strings.Contains(line, "// indirect") {
			continue
		}

		for module, replacement := range banned {
			if strings.HasPrefix(line, module+" ") {
				t.Fatalf("go.mod directly requires %s; %s instead", module, replacement)
			}
		}
	}
}

func TestGoProxmoxUsesUpstreamModule(t *testing.T) {
	data, err := os.ReadFile("go.mod")
	if err != nil {
		t.Fatalf("read go.mod: %v", err)
	}

	const module = "github.com/sergelogvinov/go-proxmox"

	for _, line := range strings.Split(string(data), "\n") {
		fields := strings.Fields(strings.TrimSpace(line))
		if len(fields) >= 4 && fields[0] == "replace" && fields[1] == module && fields[2] == "=>" {
			t.Fatalf("%s must use its upstream module without a replacement; got %s", module, line)
		}
	}
}

func TestGoProxmoxRenovateUpdatesStayCompatible(t *testing.T) {
	data, err := os.ReadFile(".github/renovate.json")
	if err != nil {
		t.Fatalf("read Renovate config: %v", err)
	}

	var config struct {
		PackageRules []struct {
			MatchPackageNames []string `json:"matchPackageNames"`
			AllowedVersions   string   `json:"allowedVersions"`
		} `json:"packageRules"`
	}
	if err := json.Unmarshal(data, &config); err != nil {
		t.Fatalf("parse Renovate config: %v", err)
	}

	expected := map[string]string{
		"github.com/luthermonson/go-proxmox":  "<=0.5.1",
		"github.com/sergelogvinov/go-proxmox": "<=0.2.0",
	}

	for module, allowedVersions := range expected {
		found := false
		for _, rule := range config.PackageRules {
			if len(rule.MatchPackageNames) == 1 && rule.MatchPackageNames[0] == module {
				found = true
				if rule.AllowedVersions != allowedVersions {
					t.Errorf("%s allowedVersions = %q, want %q", module, rule.AllowedVersions, allowedVersions)
				}
			}
		}
		if !found {
			t.Errorf("missing Renovate compatibility rule for %s", module)
		}
	}
}
