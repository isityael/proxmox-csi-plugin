## [0.10.0](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.9.0...v0.10.0) (2025-01-20)


### Features

* enable support for capmox ([6145c7d](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/6145c7d91cfc47c131ac453e2a90a915e5694b2b))

## [0.20.0](https://github.com/isityael/proxmox-csi-plugin/compare/v0.19.1...v0.20.0) (2026-07-23)


### Features

* add config options token_id_file & token_secret_file ([64dc356](https://github.com/isityael/proxmox-csi-plugin/commit/64dc356ec37085ab8d5de4d136537e08e94c3d49))
* add pvecsictl clean command ([8a19f5e](https://github.com/isityael/proxmox-csi-plugin/commit/8a19f5e6aeb8120c4e46be3e394eee375e47793c))
* add unsafe env ([36fa532](https://github.com/isityael/proxmox-csi-plugin/commit/36fa5324074d6a695404c0c94fee65ff35c2d96e))
* allow ovverid backup attribute ([2fada12](https://github.com/isityael/proxmox-csi-plugin/commit/2fada12f0a0305a7083debff4c94b088b721cf04))
* cache for storage capacity ([edfc432](https://github.com/isityael/proxmox-csi-plugin/commit/edfc432861e90af45b72748d3357744f5c20136d))
* **chart:** add allowedTopologies ([41cb02a](https://github.com/isityael/proxmox-csi-plugin/commit/41cb02a16dfa1b6abc2d2023d0d01f59a9501c8f))
* **chart:** add CSIStorageCapacity as option ([2a0f8c7](https://github.com/isityael/proxmox-csi-plugin/commit/2a0f8c75fde0fd3cf421dbba7167f0ca46f505b7))
* **chart:** add driver registrar arguments ([5d87c4b](https://github.com/isityael/proxmox-csi-plugin/commit/5d87c4bbd47f119b7dd666f857243b0b0e4d186a))
* **chart:** add initContainers and hostAliases ([769c008](https://github.com/isityael/proxmox-csi-plugin/commit/769c008bb5cbd2a21303f12171d16df78000473e))
* **chart:** add option to set volumeBindingMode of storageclass ([b3f55c4](https://github.com/isityael/proxmox-csi-plugin/commit/b3f55c4333096bdd190a7f1d9413977c256356cb))
* **chart:** add support to mount a custom CA ([9b94627](https://github.com/isityael/proxmox-csi-plugin/commit/9b94627a9fb793b679b834efcf5ce84c36e2cd39))
* **chart:** add value to customize kubeletDir ([bbb627f](https://github.com/isityael/proxmox-csi-plugin/commit/bbb627f1a871f483f47888f2b158ad3370926dd0))
* **chart:** customize pod labels ([93c1175](https://github.com/isityael/proxmox-csi-plugin/commit/93c11750ac952ce006ebe50758e95f4e1f85c61b))
* **chart:** make StorageClass parameters/mountOptions configurable ([a78e338](https://github.com/isityael/proxmox-csi-plugin/commit/a78e338d3432d176ea543a3a455cfbcc7b1f5676))
* **chart:** support affinity for node-plugin assignment ([cb57e84](https://github.com/isityael/proxmox-csi-plugin/commit/cb57e84c0a6caad8678a5d4143289c85c9d3ece2))
* **chart:** support setting annotations and labels on storageClasses ([a5f5add](https://github.com/isityael/proxmox-csi-plugin/commit/a5f5adde7c3d533cae45660da312883b4ed1a24c))
* **chart:** support snapshotter sidecar ([f8acb55](https://github.com/isityael/proxmox-csi-plugin/commit/f8acb553d183b55bb120202c9af9e629dae2bf1e))
* check topology labels ([1faa701](https://github.com/isityael/proxmox-csi-plugin/commit/1faa701e3d76939576884c78b87a90bb9e7f555c))
* concurrent attach/detach pv ([3db4ca4](https://github.com/isityael/proxmox-csi-plugin/commit/3db4ca40b8a301bb8c0426db34c23d12939f24bf))
* configurable controller VMID ([85d2949](https://github.com/isityael/proxmox-csi-plugin/commit/85d29491d74855450c56fde53122cb04de1c5c94))
* configurable maximum volume attachments per node ([0a4a98f](https://github.com/isityael/proxmox-csi-plugin/commit/0a4a98ffedef116d91d20cf60a8b9bb02e30e490))
* cosign images ([5e13f3f](https://github.com/isityael/proxmox-csi-plugin/commit/5e13f3f3874509484609350ecca3e9bd03ca4417))
* disk speed limit ([c464dab](https://github.com/isityael/proxmox-csi-plugin/commit/c464dabb186f1a451057d1ba7c736a919b607c59))
* drop node capabilities ([927f664](https://github.com/isityael/proxmox-csi-plugin/commit/927f6641a762bcf43556eaf0688fc684106002a5))
* enable support for capmox ([6145c7d](https://github.com/isityael/proxmox-csi-plugin/commit/6145c7d91cfc47c131ac453e2a90a915e5694b2b))
* enforce single commit requirement ([f7b6ff1](https://github.com/isityael/proxmox-csi-plugin/commit/f7b6ff1bb570e28dc3b26521507748025fde0016))
* expose metrics ([4bbe65d](https://github.com/isityael/proxmox-csi-plugin/commit/4bbe65dccc54192005d663fef86c2c40fd1c3b2c))
* full copy snapshot ([a333412](https://github.com/isityael/proxmox-csi-plugin/commit/a3334128eac63c8557c1d5d9f85f876b933fb299))
* get capacity with shared storages ([fa9c34b](https://github.com/isityael/proxmox-csi-plugin/commit/fa9c34bc0803236e793a7ce60fcc2c15af94ec05))
* helm oci release ([c438712](https://github.com/isityael/proxmox-csi-plugin/commit/c4387124372a08f2a31dd0934c9cf41b67f12eba))
* lifecycle management for pv ([0f7cd72](https://github.com/isityael/proxmox-csi-plugin/commit/0f7cd7237029ab20ef94e44b43c457785c834614))
* minimal chunk size ([898f6e7](https://github.com/isityael/proxmox-csi-plugin/commit/898f6e7f6572f978b9cc4fb307c84c19a5c9e910))
* mkfs block/inode size options ([88f4ebc](https://github.com/isityael/proxmox-csi-plugin/commit/88f4ebcf33cef7409090383b68bbec6f8d52ffe5))
* noatime flag for ssd ([cd4f3f7](https://github.com/isityael/proxmox-csi-plugin/commit/cd4f3f77d38ef1e6b34c337c96b3b60fd2f04007))
* node discovery service by smbios ([2fccb94](https://github.com/isityael/proxmox-csi-plugin/commit/2fccb9490468bee6156130bd82b0bc115323e734))
* pin version ([e81d8e3](https://github.com/isityael/proxmox-csi-plugin/commit/e81d8e326cd48ebd2cc2578d88bccc93d5c421ab))
* prefer providerID ([7dcde72](https://github.com/isityael/proxmox-csi-plugin/commit/7dcde72bad2b036638cb3644a35deeb8c3ee3d47))
* pv/pvc cli helper ([d97bc32](https://github.com/isityael/proxmox-csi-plugin/commit/d97bc3245f2f370deb658ccf5e54fcdc38e5929d))
* qcow2 storage format ([8576e3c](https://github.com/isityael/proxmox-csi-plugin/commit/8576e3ca1405826255dd7af48a418f19b4a70742))
* raw block device ([1be660b](https://github.com/isityael/proxmox-csi-plugin/commit/1be660bf3014fa3e1d40251561a67b76d1e9cf98))
* regional block devices ([c7d1541](https://github.com/isityael/proxmox-csi-plugin/commit/c7d1541d4d8f0818b6af27e497746415c1448e03))
* remove udev dependency ([1810ec7](https://github.com/isityael/proxmox-csi-plugin/commit/1810ec71f56a03a462219a58f81c3d24e9fb1714))
* rename disk_name to diskName to follow best practices ([415d2e2](https://github.com/isityael/proxmox-csi-plugin/commit/415d2e27bfbc691911dcc0057ebef8f4a0081857))
* storage encryption ([26c1928](https://github.com/isityael/proxmox-csi-plugin/commit/26c19288b80ed2847ab0df63e5480cf4f1f059e4))
* support different disk id ([e3a25c2](https://github.com/isityael/proxmox-csi-plugin/commit/e3a25c26a2152d8605fef42e8b0c7e2b3b3c26c4))
* support vm name with fqdn ([1cf812b](https://github.com/isityael/proxmox-csi-plugin/commit/1cf812b09e659ee22c69d5946f79e86e5c90c314))
* support volume attributes class ([bab93fb](https://github.com/isityael/proxmox-csi-plugin/commit/bab93fb05355f4e65995b60a7ec003b129fbe984))
* swap pv in already created pvc ([76c899e](https://github.com/isityael/proxmox-csi-plugin/commit/76c899e4e1c8f2287854a4e08fbbdd8a1c7360a9))
* trim filesystem ([dc7dbbd](https://github.com/isityael/proxmox-csi-plugin/commit/dc7dbbdb6e9deecab0abd439c77abffdd69f692a))
* update distroless debian image ([f50da79](https://github.com/isityael/proxmox-csi-plugin/commit/f50da79a6e96707cccc7c31e879f2fb644eec777))
* use readonly root ([ca00846](https://github.com/isityael/proxmox-csi-plugin/commit/ca00846bb87c8f0e9a35c2ab7a6f2ceadb14bcf2))
* use release please tool ([39c4b22](https://github.com/isityael/proxmox-csi-plugin/commit/39c4b223f64351c2c2e8685d55091ffe7d58a7ce))
* use returned proxmox disk name as volumeHandle ([415d2e2](https://github.com/isityael/proxmox-csi-plugin/commit/415d2e27bfbc691911dcc0057ebef8f4a0081857))
* use returned proxmox disk name as volumeHandle during volume ([415d2e2](https://github.com/isityael/proxmox-csi-plugin/commit/415d2e27bfbc691911dcc0057ebef8f4a0081857))
* volume capability ([1088dbb](https://github.com/isityael/proxmox-csi-plugin/commit/1088dbb8297802a52835bc4075b6553cb7e8a81a))
* volume replication ([0b66712](https://github.com/isityael/proxmox-csi-plugin/commit/0b667121a527b01652a773f3274af7f65dc7b7f6))
* wait volume to be detached ([3683d96](https://github.com/isityael/proxmox-csi-plugin/commit/3683d96136a52d06274788006e0c5c67d9818c93))
* zfs storage migration ([37d7fb0](https://github.com/isityael/proxmox-csi-plugin/commit/37d7fb09f2e76fa4ea5b40377777a19e8832f09e))


### Bug Fixes

* add delay before unattach device ([ff575d1](https://github.com/isityael/proxmox-csi-plugin/commit/ff575d17af06bbf629ab769e8e512872a3426e66))
* allow nfs shared storages ([04cfb97](https://github.com/isityael/proxmox-csi-plugin/commit/04cfb97993fb536994a8cf0da6542ea8f6fd696c))
* backup volume attibute ([62aba00](https://github.com/isityael/proxmox-csi-plugin/commit/62aba00732e8c91595d85b1c425ca51442af4715))
* build release ([facdec5](https://github.com/isityael/proxmox-csi-plugin/commit/facdec5be4f0335eb489fc600a175e63584953ba))
* bump deps ([099f2d7](https://github.com/isityael/proxmox-csi-plugin/commit/099f2d7a20700f76a2145c3eeb84471289a06670))
* **chart:** add missing volumeattributesclasses rule to ClusterRole ([1f10218](https://github.com/isityael/proxmox-csi-plugin/commit/1f10218dce4c78191d390b5fa839c6cd2516e33e))
* **chart:** detect safe mounted behavior ([5580695](https://github.com/isityael/proxmox-csi-plugin/commit/5580695bd9a3e55091a50a35c95cff9bd24bc390))
* **chart:** ssd parameter ([dc07d1b](https://github.com/isityael/proxmox-csi-plugin/commit/dc07d1b1884778b5614a6c853d1e8c87d6d5cb3c))
* check rbac permission ([57a6b0d](https://github.com/isityael/proxmox-csi-plugin/commit/57a6b0dbb7b60309f9185a475ac1e949878ff349))
* check volume existence ([aba0ca8](https://github.com/isityael/proxmox-csi-plugin/commit/aba0ca8fb4d96af8324de03856a55a8f130311e3))
* **ci:** use renamed chart-version-guard image ([3fc9648](https://github.com/isityael/proxmox-csi-plugin/commit/3fc96485cca3fbbd091587d18e15d337eec7c5d9))
* cli migration ([41b19bd](https://github.com/isityael/proxmox-csi-plugin/commit/41b19bdd40db9f84c0d65fe41983e2c2ee0b4977))
* cluster config credentials ([2a2ba33](https://github.com/isityael/proxmox-csi-plugin/commit/2a2ba331a62082238096639abbfb602ef025a362))
* concurrent attach/detach pv ([af365ca](https://github.com/isityael/proxmox-csi-plugin/commit/af365cadd632689b2f1b0bfaaf1a024c6cf1239c))
* **csi:** only retry on ErrVirtualMachineNotFound in waitForVM ([600fae5](https://github.com/isityael/proxmox-csi-plugin/commit/600fae5cb963c2d35948d86bda942f3fcfd19bc5))
* **csi:** wait for VM availability after creation in replication flow ([9d60e9b](https://github.com/isityael/proxmox-csi-plugin/commit/9d60e9bde8384c7639d34e15c455627e3bf4b609)), closes [#517](https://github.com/isityael/proxmox-csi-plugin/issues/517)
* deps update ([657ad00](https://github.com/isityael/proxmox-csi-plugin/commit/657ad006c2e93f27ed08966c8e493cfb852a49ee))
* **deps:** update github.com/luthermonson/go-proxmox to v0.6.0 ([6d098db](https://github.com/isityael/proxmox-csi-plugin/commit/6d098dbfb7a962f2ade866bc17b082f29ebb9405))
* **deps:** update k8s.io/utils digest to be93311 ([cbb1be6](https://github.com/isityael/proxmox-csi-plugin/commit/cbb1be6e8985cff4a105355a6370693b0a103af5))
* **deps:** update k8s.io/utils digest to cf1189d ([fe745b0](https://github.com/isityael/proxmox-csi-plugin/commit/fe745b0ee841c3b7168267dd00090c9ea663301d))
* **deps:** update kubernetes go modules ([ab45624](https://github.com/isityael/proxmox-csi-plugin/commit/ab4562459141053f06ef594435f531234435a955))
* **deps:** update kubernetes go modules to a95e086 ([3bdc80a](https://github.com/isityael/proxmox-csi-plugin/commit/3bdc80acfa0e373f3dc706e8755a6069e1e44380))
* **deps:** update kubernetes go modules to v0.36.0 ([d3c33cf](https://github.com/isityael/proxmox-csi-plugin/commit/d3c33cfad1c510e168802ecd43205d1810a1d3a6))
* **deps:** update kubernetes go modules to v0.36.2 ([d1ba571](https://github.com/isityael/proxmox-csi-plugin/commit/d1ba57181f6741fa76883fd1bf68fdafaa59e1fd))
* **deps:** update kubernetes go modules to v0.36.3 ([3fc2aa1](https://github.com/isityael/proxmox-csi-plugin/commit/3fc2aa17cc253a733e22355498e253852a9efff3))
* **deps:** update module github.com/kubernetes-csi/csi-lib-utils to v0.24.0 ([2c093fb](https://github.com/isityael/proxmox-csi-plugin/commit/2c093fb34ac61dae70af9a4d73016eca89c221be))
* **deps:** update module github.com/luthermonson/go-proxmox to v0.4.1 ([7b7b6c7](https://github.com/isityael/proxmox-csi-plugin/commit/7b7b6c779ea0aaac1571f406f33d15ed40874014))
* **deps:** update module github.com/luthermonson/go-proxmox to v0.4.1 ([#4](https://github.com/isityael/proxmox-csi-plugin/issues/4)) ([f918b38](https://github.com/isityael/proxmox-csi-plugin/commit/f918b3846283d443017e9c299529c58d974e7ff9))
* **deps:** update module github.com/luthermonson/go-proxmox to v0.5.1 ([cbb6e49](https://github.com/isityael/proxmox-csi-plugin/commit/cbb6e4914bab09be16908100c395f7f54b07d751))
* **deps:** update module github.com/luthermonson/go-proxmox to v0.6.0 ([54621f4](https://github.com/isityael/proxmox-csi-plugin/commit/54621f43b6a09a012d06c12d62f564ea30707604))
* **deps:** update module github.com/luthermonson/go-proxmox to v0.7.0 ([edaadb3](https://github.com/isityael/proxmox-csi-plugin/commit/edaadb38e5dbf8cf6c3834e00016fe795a105f18))
* **deps:** update module github.com/luthermonson/go-proxmox to v0.7.0 ([0c95368](https://github.com/isityael/proxmox-csi-plugin/commit/0c95368f6e3a286b85ddd7dcb68db351b18258f0))
* **deps:** update module github.com/luthermonson/go-proxmox to v0.7.1 ([195efd1](https://github.com/isityael/proxmox-csi-plugin/commit/195efd10db7a589783b0a996a76275fee0ef3334))
* **deps:** update module github.com/luthermonson/go-proxmox to v0.8.0 ([31a8e69](https://github.com/isityael/proxmox-csi-plugin/commit/31a8e69c4d1d5218bb8acb5fcfcb20cd59925a1d))
* **deps:** update module github.com/sergelogvinov/go-proxmox to v0.2.0 ([0e9ee1c](https://github.com/isityael/proxmox-csi-plugin/commit/0e9ee1cc35ba361004ba4886e369f345d1aa9cb5))
* **deps:** update module github.com/sergelogvinov/go-proxmox to v0.2.0 ([#7](https://github.com/isityael/proxmox-csi-plugin/issues/7)) ([53d1698](https://github.com/isityael/proxmox-csi-plugin/commit/53d1698ee6693aec6800dae9e4951c719565ac2f))
* **deps:** update module github.com/sergelogvinov/go-proxmox to v0.3.0 ([9c764de](https://github.com/isityael/proxmox-csi-plugin/commit/9c764def023e9a87b753fadd86593743f056c67a))
* **deps:** update module github.com/siderolabs/go-blockdevice to v2 ([f8a9a0e](https://github.com/isityael/proxmox-csi-plugin/commit/f8a9a0e5a2390cbb3360bbc7586bbf78a83e0576))
* **deps:** update module github.com/siderolabs/go-blockdevice to v2 ([#9](https://github.com/isityael/proxmox-csi-plugin/issues/9)) ([b174c18](https://github.com/isityael/proxmox-csi-plugin/commit/b174c187d11b811b79cabf09e156a902eec72386))
* **deps:** update module github.com/siderolabs/go-blockdevice/v2 to v2.0.30 ([fced1f6](https://github.com/isityael/proxmox-csi-plugin/commit/fced1f617fdb4939bf5d93bfda4e39de0fa8a6aa))
* **deps:** update module github.com/siderolabs/go-blockdevice/v2 to v2.0.31 ([9743230](https://github.com/isityael/proxmox-csi-plugin/commit/9743230a693b30efdd3183a7d0a0bbee49dd705f))
* **deps:** update module github.com/siderolabs/go-blockdevice/v2 to v2.0.32 ([c854e08](https://github.com/isityael/proxmox-csi-plugin/commit/c854e080c197e239216c4e156bced20d15783be7))
* **deps:** update module google.golang.org/grpc to v1.80.0 ([2ab6f3b](https://github.com/isityael/proxmox-csi-plugin/commit/2ab6f3b5e3b12dd777e6e657147d78b6e31108ea))
* **deps:** update module google.golang.org/grpc to v1.80.0 ([#8](https://github.com/isityael/proxmox-csi-plugin/issues/8)) ([5068deb](https://github.com/isityael/proxmox-csi-plugin/commit/5068deb760cd4be310b4d27beb0c9979fff1843e))
* **deps:** update module google.golang.org/grpc to v1.81.0 ([6f09b00](https://github.com/isityael/proxmox-csi-plugin/commit/6f09b00a17522435e48c73ba5cf9366b73bee21a))
* **deps:** update module google.golang.org/grpc to v1.81.1 ([6229b6b](https://github.com/isityael/proxmox-csi-plugin/commit/6229b6bd7269d1ff0e00982c75835ee82c88b17e))
* **deps:** update module google.golang.org/grpc to v1.82.0 ([db657d4](https://github.com/isityael/proxmox-csi-plugin/commit/db657d4cdfac49f4615c8285b9eaa7a059cdb45d))
* **deps:** update module google.golang.org/grpc to v1.82.1 ([22d78db](https://github.com/isityael/proxmox-csi-plugin/commit/22d78db976d9560eee59ff6a872b446c2b0ef8ec))
* detach volume error ([dc128d1](https://github.com/isityael/proxmox-csi-plugin/commit/dc128d17ab1e298bff267d7b776e893ba7929d3e))
* documentation ([78b4b19](https://github.com/isityael/proxmox-csi-plugin/commit/78b4b19012247782e7467d0bcbc23f5ce1edb64b))
* empty named vms ([2da5ee4](https://github.com/isityael/proxmox-csi-plugin/commit/2da5ee4c2450cbc00c7a38bb032ac7ee6fd74ded))
* file storage type definition ([e0aea19](https://github.com/isityael/proxmox-csi-plugin/commit/e0aea19dd01a3c2c2baf271d9e85374e37df77ae))
* find zone by region ([4eae22d](https://github.com/isityael/proxmox-csi-plugin/commit/4eae22d81c2ccd08a159f04412918deb09e19ab5))
* get volume annotation ([5528f1d](https://github.com/isityael/proxmox-csi-plugin/commit/5528f1d0706196e3a57a3c73b0f9ea35ceb4cc80))
* gorelease version ([8179b2c](https://github.com/isityael/proxmox-csi-plugin/commit/8179b2c0c3221e90a8d02152d151b0f7b6253baf))
* goreleaser ([c1d0907](https://github.com/isityael/proxmox-csi-plugin/commit/c1d090788efcb1dff46782b4c14cb1877d72dd24))
* goreleaser ([4e0e87a](https://github.com/isityael/proxmox-csi-plugin/commit/4e0e87a34671681394b901f4956fae605dd892e3))
* goreleaser ([04a40f4](https://github.com/isityael/proxmox-csi-plugin/commit/04a40f40ebd6ef8904bdcc083ce028cf87544019))
* goreleaser cosign signing ([57e9907](https://github.com/isityael/proxmox-csi-plugin/commit/57e9907502ac9da137f97adda18bb0f11a5bc381))
* goreleaser homebrew artifacts ([a2ed7f3](https://github.com/isityael/proxmox-csi-plugin/commit/a2ed7f3d1045e36a3a54ad1c66c2ad4bad5634e8))
* guard compatible go-proxmox updates ([9bef972](https://github.com/isityael/proxmox-csi-plugin/commit/9bef972968dc0cc2ee981c20a863871460193925))
* handle shared volumes ([ba9306c](https://github.com/isityael/proxmox-csi-plugin/commit/ba9306c866d93f6f811d943a1acee3b5ad3cf848))
* handle snapshot creation with missing parameters ([3258de0](https://github.com/isityael/proxmox-csi-plugin/commit/3258de012a2d5cf8f6c339771376f31707e44273))
* handle unmount when node does not exist ([f43f18f](https://github.com/isityael/proxmox-csi-plugin/commit/f43f18fdd42764a6c296c9e4c7e509a32767d856))
* helm chart metrics option ([e5ef1b1](https://github.com/isityael/proxmox-csi-plugin/commit/e5ef1b132251e7bfb98234ee3ea935524db55d16))
* helm chart podAnnotation ([b935d88](https://github.com/isityael/proxmox-csi-plugin/commit/b935d88e14df3982ff59541ee0732e5b421a2088))
* helm create namespace ([364b8be](https://github.com/isityael/proxmox-csi-plugin/commit/364b8bee9342e8c6437078dfc0488784d8a41000))
* helm liveness context ([e1ed889](https://github.com/isityael/proxmox-csi-plugin/commit/e1ed889510ce2309f2f63243c95e50b03c50254e))
* implement structured logging ([cb5fb4e](https://github.com/isityael/proxmox-csi-plugin/commit/cb5fb4e0339fa714e13e421e557252ab348dbe25))
* kubectl apply in readme ([bc2f88b](https://github.com/isityael/proxmox-csi-plugin/commit/bc2f88bdd01c68be2be620af464461459279f642))
* label fork images with sm-moshi source ([7be8fb6](https://github.com/isityael/proxmox-csi-plugin/commit/7be8fb679c1050e10ee51e3015ff8bb430323164))
* log sanitizer ([474e734](https://github.com/isityael/proxmox-csi-plugin/commit/474e734e52b7725b62183911f7843e80b51594e1))
* migrate default timeout ([42ad22a](https://github.com/isityael/proxmox-csi-plugin/commit/42ad22ae04fa7b4ee594e82df579d08b73e2739e))
* parametes attributes ([820cb7e](https://github.com/isityael/proxmox-csi-plugin/commit/820cb7ea11e09d1d8c7c6feff176350b20135f62))
* publish release images under fork namespace ([6d6e1d6](https://github.com/isityael/proxmox-csi-plugin/commit/6d6e1d665343e04d890c6cc4b021efd4b8ed2da7))
* publish shared volumes ([a681b2b](https://github.com/isityael/proxmox-csi-plugin/commit/a681b2b2b6431a23ef45e1705b0adb85dca34f5b))
* pv force migration ([8ecf990](https://github.com/isityael/proxmox-csi-plugin/commit/8ecf990a9b746358a505c25c0c728fd77d776b00))
* pv migrate watch ([7b8a477](https://github.com/isityael/proxmox-csi-plugin/commit/7b8a477febad84fc70da833e93bcc1b1574af560))
* pvc migration ([51cf245](https://github.com/isityael/proxmox-csi-plugin/commit/51cf245ab7e824e3c536e7d71b90659f0b4e7da7))
* pvc migration ([ddfc362](https://github.com/isityael/proxmox-csi-plugin/commit/ddfc36229ccdf2fdc29e9fff9e59463f4b2da866))
* **pvecsictl:** address review feedback from upstream PR ([f6f510e](https://github.com/isityael/proxmox-csi-plugin/commit/f6f510e5d9283f9ab74811a78bdaf98978d87228))
* **pvecsictl:** resolve VMID from node providerID instead of VM name ([fe0033a](https://github.com/isityael/proxmox-csi-plugin/commit/fe0033aaf2129cd436d5db609596010b18ae5665))
* pveum role add command missing '.Disk' in install.md ([ea55e23](https://github.com/isityael/proxmox-csi-plugin/commit/ea55e23f07496626779de896deab0c1303f47c79))
* release doc ([215c366](https://github.com/isityael/proxmox-csi-plugin/commit/215c366b5bb4bc86e7bee43fcf4a228193fcbbbe))
* release please ([593f605](https://github.com/isityael/proxmox-csi-plugin/commit/593f605fdb2b8f3fc6ece800bb44f4cfb93df882))
* release please ([ffad744](https://github.com/isityael/proxmox-csi-plugin/commit/ffad744ed54f59eb8cf610f84855845de4625886))
* remove nocloud label ([74e42b2](https://github.com/isityael/proxmox-csi-plugin/commit/74e42b2818d199fd4058f7dbd26eea1e4f70647a))
* remove redundant PV keep-flag check and support arbitrary VolumeIDs ([be54c6b](https://github.com/isityael/proxmox-csi-plugin/commit/be54c6b40da108b9b9d88a6c40888a0bf3e66e16))
* remove storage pool from disk name as this is already known ([415d2e2](https://github.com/isityael/proxmox-csi-plugin/commit/415d2e27bfbc691911dcc0057ebef8f4a0081857))
* remove the pv from the dead node ([b0bcd03](https://github.com/isityael/proxmox-csi-plugin/commit/b0bcd037611e1a97119d5593baed41156fc64218))
* reset vol.Node() in checkVolume for shared storage ([1715244](https://github.com/isityael/proxmox-csi-plugin/commit/1715244c7c6282843cf749829df0bda413b51991))
* resolve VMID from node providerID instead of VM name ([6963566](https://github.com/isityael/proxmox-csi-plugin/commit/6963566e827cbc6950d8b90e44e375df704dfc26))
* restore compatible go-proxmox replacement ([e9f5491](https://github.com/isityael/proxmox-csi-plugin/commit/e9f549166134154bba19b06a05123afd7f22109a))
* skip lxc containers on resize process ([a24d24e](https://github.com/isityael/proxmox-csi-plugin/commit/a24d24e6ac81f76f06adc9d834beba769975d055))
* storage topology ([d7d31ca](https://github.com/isityael/proxmox-csi-plugin/commit/d7d31cad770cc8c1607013adc63624b17b079234))
* storageclass parameters ([82ac3ac](https://github.com/isityael/proxmox-csi-plugin/commit/82ac3acbaa64a87b68530df2e1f0a7c7179776fb))
* support go-proxmox v0.7 ([e6caec4](https://github.com/isityael/proxmox-csi-plugin/commit/e6caec4196fdb9aeefb728363fe7f0deada0e695))
* sync upstream and shared storage handling ([#30](https://github.com/isityael/proxmox-csi-plugin/issues/30)) ([e3a1fa0](https://github.com/isityael/proxmox-csi-plugin/commit/e3a1fa0e4658d3856f644fa5ab46cbf7c9a63ae5))
* unpublish when the node no longer exists ([a5d8c70](https://github.com/isityael/proxmox-csi-plugin/commit/a5d8c70240602788baf93c294bd1366c0fc06486))
* vmlock race condition ([2d34bec](https://github.com/isityael/proxmox-csi-plugin/commit/2d34becc117b9c429e6deb14e51a9591aa4e196a))
* volume attributes ([af7a276](https://github.com/isityael/proxmox-csi-plugin/commit/af7a27629691f030d1ec5ffbff3240ef834fb14f))
* volume size ([b08a592](https://github.com/isityael/proxmox-csi-plugin/commit/b08a5927e34401112a13ae834b9b9ed709a3493f))
* volume size check ([e8c0b7d](https://github.com/isityael/proxmox-csi-plugin/commit/e8c0b7d3b6e0ca1d4eb555598d7ea0ae7dfac1dd))
* wait for volume to attach ([4912d43](https://github.com/isityael/proxmox-csi-plugin/commit/4912d43f472a5bca8b1026d309a050c4dd6131bc))
* zfs replication ([831f13b](https://github.com/isityael/proxmox-csi-plugin/commit/831f13b2090427ab69202bfd21e3fa174245a378))

## [0.19.1](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.19.0...v0.19.1) (2026-06-25)


### Bug Fixes

* goreleaser cosign signing ([57e9907](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/57e9907502ac9da137f97adda18bb0f11a5bc381))
* handle shared volumes ([ba9306c](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/ba9306c866d93f6f811d943a1acee3b5ad3cf848))
* pvc migration ([51cf245](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/51cf245ab7e824e3c536e7d71b90659f0b4e7da7))

## [0.19.0](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.18.1...v0.19.0) (2026-06-19)


### Features

* **chart:** add option to set volumeBindingMode of storageclass ([b3f55c4](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/b3f55c4333096bdd190a7f1d9413977c256356cb))
* configurable controller VMID ([85d2949](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/85d29491d74855450c56fde53122cb04de1c5c94))


### Bug Fixes

* bump deps ([099f2d7](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/099f2d7a20700f76a2145c3eeb84471289a06670))
* cluster config credentials ([2a2ba33](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/2a2ba331a62082238096639abbfb602ef025a362))
* reset vol.Node() in checkVolume for shared storage ([1715244](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/1715244c7c6282843cf749829df0bda413b51991))
* resolve VMID from node providerID instead of VM name ([6963566](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/6963566e827cbc6950d8b90e44e375df704dfc26))

## [0.18.1](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.18.0...v0.18.1) (2026-04-04)


### Bug Fixes

* goreleaser ([c1d0907](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/c1d090788efcb1dff46782b4c14cb1877d72dd24))
* handle unmount when node does not exist ([f43f18f](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/f43f18fdd42764a6c296c9e4c7e509a32767d856))
* pv migrate watch ([7b8a477](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/7b8a477febad84fc70da833e93bcc1b1574af560))

## [0.18.0](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.17.1...v0.18.0) (2026-01-24)


### Features

* rename disk_name to diskName to follow best practices ([415d2e2](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/415d2e27bfbc691911dcc0057ebef8f4a0081857))
* use returned proxmox disk name as volumeHandle ([415d2e2](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/415d2e27bfbc691911dcc0057ebef8f4a0081857))
* use returned proxmox disk name as volumeHandle during volume ([415d2e2](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/415d2e27bfbc691911dcc0057ebef8f4a0081857))


### Bug Fixes

* remove redundant PV keep-flag check and support arbitrary VolumeIDs ([be54c6b](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/be54c6b40da108b9b9d88a6c40888a0bf3e66e16))
* remove storage pool from disk name as this is already known ([415d2e2](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/415d2e27bfbc691911dcc0057ebef8f4a0081857))
* zfs replication ([831f13b](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/831f13b2090427ab69202bfd21e3fa174245a378))

## [0.17.1](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.17.0...v0.17.1) (2026-01-02)


### Bug Fixes

* gorelease version ([8179b2c](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/8179b2c0c3221e90a8d02152d151b0f7b6253baf))
* storage topology ([d7d31ca](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/d7d31cad770cc8c1607013adc63624b17b079234))
* vmlock race condition ([2d34bec](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/2d34becc117b9c429e6deb14e51a9591aa4e196a))

## [0.17.0](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.16.0...v0.17.0) (2025-12-13)


### Features

* **chart:** add driver registrar arguments ([5d87c4b](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/5d87c4bbd47f119b7dd666f857243b0b0e4d186a))
* **chart:** support affinity for node-plugin assignment ([cb57e84](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/cb57e84c0a6caad8678a5d4143289c85c9d3ece2))


### Bug Fixes

* file storage type definition ([e0aea19](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/e0aea19dd01a3c2c2baf271d9e85374e37df77ae))

## [0.16.0](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.15.1...v0.16.0) (2025-11-22)


### Features

* cache for storage capacity ([edfc432](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/edfc432861e90af45b72748d3357744f5c20136d))
* **chart:** support snapshotter sidecar ([f8acb55](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/f8acb553d183b55bb120202c9af9e629dae2bf1e))
* check topology labels ([1faa701](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/1faa701e3d76939576884c78b87a90bb9e7f555c))
* full copy snapshot ([a333412](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/a3334128eac63c8557c1d5d9f85f876b933fb299))
* node discovery service by smbios ([2fccb94](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/2fccb9490468bee6156130bd82b0bc115323e734))


### Bug Fixes

* documentation ([78b4b19](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/78b4b19012247782e7467d0bcbc23f5ce1edb64b))
* goreleaser homebrew artifacts ([a2ed7f3](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/a2ed7f3d1045e36a3a54ad1c66c2ad4bad5634e8))
* handle snapshot creation with missing parameters ([3258de0](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/3258de012a2d5cf8f6c339771376f31707e44273))
* migrate default timeout ([42ad22a](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/42ad22ae04fa7b4ee594e82df579d08b73e2739e))
* volume attributes ([af7a276](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/af7a27629691f030d1ec5ffbff3240ef834fb14f))
* wait for volume to attach ([4912d43](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/4912d43f472a5bca8b1026d309a050c4dd6131bc))

## [0.15.1](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.15.0...v0.15.1) (2025-11-03)


### Bug Fixes

* storageclass parameters ([82ac3ac](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/82ac3acbaa64a87b68530df2e1f0a7c7179776fb))

## [0.15.0](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.14.0...v0.15.0) (2025-11-01)


### Features

* support vm name with fqdn ([1cf812b](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/1cf812b09e659ee22c69d5946f79e86e5c90c314))
* update distroless debian image ([f50da79](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/f50da79a6e96707cccc7c31e879f2fb644eec777))


### Bug Fixes

* backup volume attibute ([62aba00](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/62aba00732e8c91595d85b1c425ca51442af4715))

## [0.14.0](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.13.0...v0.14.0) (2025-10-05)


### Features

* add config options token_id_file & token_secret_file ([64dc356](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/64dc356ec37085ab8d5de4d136537e08e94c3d49))


### Bug Fixes

* **chart:** ssd parameter ([dc07d1b](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/dc07d1b1884778b5614a6c853d1e8c87d6d5cb3c))
* pveum role add command missing '.Disk' in install.md ([ea55e23](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/ea55e23f07496626779de896deab0c1303f47c79))

## [0.13.0](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.12.1...v0.13.0) (2025-07-20)


### Features

* **chart:** customize pod labels ([93c1175](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/93c11750ac952ce006ebe50758e95f4e1f85c61b))
* concurrent attach/detach pv ([3db4ca4](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/3db4ca40b8a301bb8c0426db34c23d12939f24bf))
* get capacity with shared storages ([fa9c34b](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/fa9c34bc0803236e793a7ce60fcc2c15af94ec05))
* qcow2 storage format ([8576e3c](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/8576e3ca1405826255dd7af48a418f19b4a70742))


### Bug Fixes

* concurrent attach/detach pv ([af365ca](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/af365cadd632689b2f1b0bfaaf1a024c6cf1239c))
* get volume annotation ([5528f1d](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/5528f1d0706196e3a57a3c73b0f9ea35ceb4cc80))

## [0.12.1](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.12.0...v0.12.1) (2025-06-10)


### Bug Fixes

* unpublish when the node no longer exists ([a5d8c70](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/a5d8c70240602788baf93c294bd1366c0fc06486))

## [0.12.0](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.11.0...v0.12.0) (2025-06-09)


### Features

* **chart:** add CSIStorageCapacity as option ([2a0f8c7](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/2a0f8c75fde0fd3cf421dbba7167f0ca46f505b7))
* configurable maximum volume attachments per node ([0a4a98f](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/0a4a98ffedef116d91d20cf60a8b9bb02e30e490))
* enforce single commit requirement ([f7b6ff1](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/f7b6ff1bb570e28dc3b26521507748025fde0016))
* lifecycle management for pv ([0f7cd72](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/0f7cd7237029ab20ef94e44b43c457785c834614))


### Bug Fixes

* **chart:** add missing volumeattributesclasses rule to ClusterRole ([1f10218](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/1f10218dce4c78191d390b5fa839c6cd2516e33e))
* empty named vms ([2da5ee4](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/2da5ee4c2450cbc00c7a38bb032ac7ee6fd74ded))
* remove the pv from the dead node ([b0bcd03](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/b0bcd037611e1a97119d5593baed41156fc64218))

## [0.11.0](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.10.0...v0.11.0) (2025-02-08)


### Features

* allow ovverid backup attribute ([2fada12](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/2fada12f0a0305a7083debff4c94b088b721cf04))
* support different disk id ([e3a25c2](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/e3a25c26a2152d8605fef42e8b0c7e2b3b3c26c4))
* support volume attributes class ([bab93fb](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/bab93fb05355f4e65995b60a7ec003b129fbe984))
* volume replication ([0b66712](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/0b667121a527b01652a773f3274af7f65dc7b7f6))
* zfs storage migration ([37d7fb0](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/37d7fb09f2e76fa4ea5b40377777a19e8832f09e))


### Bug Fixes

* parametes attributes ([820cb7e](https://github.com/sergelogvinov/proxmox-csi-plugin/commit/820cb7ea11e09d1d8c7c6feff176350b20135f62))

## [v0.9.0](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.8.2...v0.9.0) (2025-01-01)

Welcome to the v0.9.0 release of Proxmox CSI Plugin!

### Bug Fixes

- volume size (b08a592)

### Features

- minimal chunk size (898f6e7)

### Miscellaneous

- release v0.9.0 (1555d55)
- bump deps (a30235b)
- bump deps (db61132)
- bump deps (0695c22)
- bump deps (2351ca2)
- release v0.8.2 (0cd72b0)
- **chart:** update csi sidecar (d3b2b84)


## [v0.8.2](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.8.1...v0.8.2) (2024-09-28)

Welcome to the v0.8.2 release of Proxmox CSI Plugin!

### Bug Fixes

- log sanitizer (474e734)

### Miscellaneous

- release v0.8.2 (0274c03)


## [v0.8.1](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.8.0...v0.8.1) (2024-09-24)

Welcome to the v0.8.1 release of Proxmox CSI Plugin!

### Bug Fixes

- release please (593f605)
- goreleaser (4e0e87a)

### Miscellaneous

- release v0.8.1 (3f8bd85)


## [v0.8.0](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.7.0...v0.8.0) (2024-09-23)

Welcome to the v0.8.0 release of Proxmox CSI Plugin!

### Bug Fixes

- check rbac permission (57a6b0d)
- helm chart metrics option (e5ef1b1)
- allow nfs shared storages (04cfb97)
- helm chart podAnnotation (b935d88)

### Features

- expose metrics (4bbe65d)
- add unsafe env (36fa532)

### Miscellaneous

- release v0.8.0 (589de9c)
- bump deps (9a0161b)
- bump deps (3c3c122)
- bump deps (c5769c1)
- **chart:** update readme (c76555a)


## [v0.7.0](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.6.1...v0.7.0) (2024-06-14)

Welcome to the v0.7.0 release of Proxmox CSI Plugin!

### Bug Fixes

- implement structured logging (cb5fb4e)
- pv force migration (8ecf990)

### Features

- wait volume to be detached (3683d96)
- swap pv in already created pvc (76c899e)

### Miscellaneous

- release v0.7.0 (9424c06)
- release v0.7.0 (7362940)
- bump deps (5bf0677)
- bump deps (89adec9)
- release v0.6.1 (ac1ef92)


## [v0.6.1](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.6.0...v0.6.1) (2024-04-13)

Welcome to the v0.6.1 release of Proxmox CSI Plugin!

### Bug Fixes

- build release (facdec5)
- release doc (215c366)

### Miscellaneous

- release v0.6.1 (e7dfde2)


## [v0.6.0](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.5.0...v0.6.0) (2024-04-13)

Welcome to the v0.6.0 release of Proxmox CSI Plugin!

### Bug Fixes

- pvc migration (ddfc362)
- deps update (657ad00)
- cli migration (41b19bd)
- goreleaser (04a40f4)

### Features

- remove udev dependency (1810ec7)
- **chart:** support setting annotations and labels on storageClasses (a5f5add)
- **chart:** add initContainers and hostAliases (769c008)

### Miscellaneous

- release v0.6.0 (0b13bd0)
- bump deps (67dc34c)
- bump deps (2f9f17a)
- **chart:** update sidecar deps (5f16e6b)


## [v0.5.0](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.4.1...v0.5.0) (2024-02-20)

Welcome to the v0.5.0 release of Proxmox CSI Plugin!

### Bug Fixes

- add delay before unattach device (ff575d1)
- release please (ffad744)
- **chart:** detect safe mounted behavior (5580695)

### Features

- prefer providerID (7dcde72)
- pv/pvc cli helper (d97bc32)
- use release please tool (39c4b22)
- use readonly root (ca00846)
- raw block device (1be660b)
- **chart:** add support to mount a custom CA (9b94627)

### Miscellaneous

- release v0.5.0 (a361ce9)
- bump deps (ac4ddd0)


## [v0.4.1](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.4.0...v0.4.1) (2024-01-01)

Welcome to the v0.4.1 release of Proxmox CSI Plugin!

### Bug Fixes

- publish shared volumes (a681b2b)
- find zone by region (4eae22d)

### Features

- **chart:** add value to customize kubeletDir (bbb627f)
- **chart:** add allowedTopologies (41cb02a)

### Miscellaneous

- release v0.4.1 (fd8d14f)
- bump deps (2a86bd7)
- bump deps (d8c98ea)
- bump deps (9054282)


## [v0.4.0](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.3.0...v0.4.0) (2023-10-24)

Welcome to the v0.4.0 release of Proxmox CSI Plugin!

### Bug Fixes

- check volume existence (aba0ca8)
- helm create namespace (364b8be)
- remove nocloud label (74e42b2)

### Features

- mkfs block/inode size options (88f4ebc)
- disk speed limit (c464dab)
- **chart:** make StorageClass parameters/mountOptions configurable (a78e338)

### Miscellaneous

- release v0.4.0 (764b741)
- bump deps (9e5a139)
- bump deps (a243ffb)


## [v0.3.0](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.2.0...v0.3.0) (2023-09-19)

Welcome to the v0.3.0 release of Proxmox CSI Plugin!

### Features

- storage encryption (26c1928)
- volume capability (1088dbb)
- regional block devices (c7d1541)

### Miscellaneous

- release v0.3.0 (324ad91)
- bump deps (5f5d781)
- bump actions/checkout from 3 to 4 (f75bfff)
- bump sigstore/cosign-installer from 3.1.1 to 3.1.2 (51419d3)
- bump deps (ae63a06)
- bump deps (4ceef77)


## [v0.2.0](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.1.1...v0.2.0) (2023-08-07)

Welcome to the v0.2.0 release of Proxmox CSI Plugin!

### Bug Fixes

- skip lxc containers on resize process (a24d24e)
- helm liveness context (e1ed889)
- detach volume error (dc128d1)
- kubectl apply in readme (bc2f88b)

### Features

- noatime flag for ssd (cd4f3f7)
- cosign images (5e13f3f)
- pin version (e81d8e3)
- helm oci release (c438712)
- drop node capabilities (927f664)
- trim filesystem (dc7dbbd)

### Miscellaneous

- release v0.2.0 (6a2d98a)
- bump actions versions (b477132)
- bump deps (f6d726c)
- bump deps (ecea2ad)
- bump deps (28f0a72)
- bump deps (f00f057)


## [v0.1.1](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.1.0...v0.1.1) (2023-05-12)

Welcome to the v0.1.1 release of Proxmox CSI Plugin!

### Features

- switch to distroless (ff1c9bf)
- decrease node image (93a04b6)

### Miscellaneous

- release v0.1.1 (429a420)
- bump deps (4e80caf)
- bump deps (be954c9)


## [v0.1.0](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.0.2...v0.1.0) (2023-05-04)

Welcome to the v0.1.0 release of Proxmox CSI Plugin!

### Bug Fixes

- release check (c3bd4e7)

### Miscellaneous

- release v0.1.0 (449bddf)


## [v0.0.2](https://github.com/sergelogvinov/proxmox-csi-plugin/compare/v0.01...v0.0.2) (2023-04-29)

Welcome to the v0.0.2 release of Proxmox CSI Plugin!

### Miscellaneous

- release v0.0.2 (8390a9f)


## v0.01 (2023-04-29)

Welcome to the v0.01 release of Proxmox CSI Plugin!

### Bug Fixes

- raise condition during volume attach (3bf3ef5)
- cluster schema (494a82b)

### Features

- resize pvc (bd2c653)
- node daemon (54dec7d)
- node daemonsets (269c708)
- controller (9f0f7a3)

### Miscellaneous

- release v0.0.1 (56b4297)
