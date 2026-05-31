package proxmoxcsiplugin_test

import (
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

func TestGoProxmoxReplacementStaysOnCompatibleForkCommit(t *testing.T) {
	data, err := os.ReadFile("go.mod")
	if err != nil {
		t.Fatalf("read go.mod: %v", err)
	}

	const module = "github.com/sergelogvinov/go-proxmox"
	const replacement = "github.com/yaelmoshi/go-proxmox"
	const compatibleCommit = "b325a853bc4f"

	for _, line := range strings.Split(string(data), "\n") {
		fields := strings.Fields(strings.TrimSpace(line))
		if len(fields) == 5 && fields[0] == "replace" && fields[1] == module && fields[2] == "=>" && fields[3] == replacement {
			if !strings.HasSuffix(fields[4], compatibleCommit) {
				t.Fatalf("%s replacement must stay at compatible %s commit %s; got %s", module, replacement, compatibleCommit, fields[4])
			}
			return
		}
	}

	t.Fatalf("missing replace directive for %s => %s", module, replacement)
}
