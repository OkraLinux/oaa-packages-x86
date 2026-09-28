#!/bin/bash
set -euo pipefail

Organization=OkraLinux
Repository=oaa-packages-x86
SourceDirectory="$(cd "$(dirname "$0")/.." && pwd)"
WorkDirectory="${RUNNER_TEMP:-/tmp}/okra-publish"
Token="${PublishToken:?missing PublishToken}"

rm -rf "$WorkDirectory"
git clone --depth 1 "https://x-access-token:${Token}@github.com/${Organization}/${Repository}.git" "$WorkDirectory"

mkdir -p "$WorkDirectory/packages" "$WorkDirectory/scripts"
cp -f "$SourceDirectory"/packages/*.conf "$WorkDirectory/packages/"
cp -f "$SourceDirectory"/scripts/build-package.sh "$WorkDirectory/scripts/"

rm -rf "$WorkDirectory/out"
mkdir -p "$WorkDirectory/out"
cp -a "$SourceDirectory"/out/. "$WorkDirectory/out/"

cd "$WorkDirectory"
git config user.name "OkraLinux Build"
git config user.email "build@okralinux.cn"
git add -A

if git diff --cached --quiet; then
	echo "nothing to publish"
	exit 0
fi

git commit -m "update oaa packages"
git push origin HEAD:main
echo "published to ${Organization}/${Repository}"