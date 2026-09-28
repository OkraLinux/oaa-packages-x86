OAA packages x86_64

OkraLinux x86_64 基础软件包的构建产物

packages 是配方，scripts 是构建脚本

out 里每个包一个文件夹，只放 sources 和 sha256

oaa 本体在 Release 里，tag 是 packages

构建

push 到 main 会触发全量构建，也可以在 actions 里手动指定单个包

    bash scripts/build-package.sh grep

必须在 x86_64 的 linux 上跑

加包就在 packages 里加一个 conf，脚本会自动收集

依赖关系写在 conf 的 Dependencies 里

源码没有进仓库，sources 里记的是地址和哈希