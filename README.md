OAA packages x86_64

OkraLinux x86_64 基础软件包的构建产物

packages 是配方，scripts 是构建脚本，out 是编译好的 oaa

out 里每个包三份文件，oaa 本体，sha256 校验，sources 记源码地址和哈希

重新构建任意一个包

    bash scripts/build-package.sh grep

要在 x86_64 的 linux 上跑

加包就在 packages 里加一个 conf，脚本会自动收集，不用改别的地方

依赖关系写在 conf 的 Dependencies 里，现在都是依赖 glibc

这一批是补齐基础系统缺的工具，和 aarch64 那套 oaa-packages 内容一致，只是架构不同

源码没有放进仓库，只存地址和 sha256，要归档的话把 sources 里的 tar 包拉下来就行
