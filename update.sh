#!/usr/bin/env bash

set -e

COMMAND_LIST="sha256sum curl"
PKG_FILENAME="package.sh"

# PKG_FILENAME variables
# version : git head commit
# archive_hash : sha256sum
# files : first line tarball

# Check required commands
for command in ${COMMAND_LIST}; do
    command -v ${command} >/dev/null 2>&1 || (echo  "Please install ${command} before launching the script" && exit 1);
done

# Get libretro packages list
pkg_path_list=`find . -name ${PKG_FILENAME}`

for pkg_path in ${pkg_path_list}
do
    echo "Updating ${pkg_path}" && source ${pkg_path}
    # Update version
    git_url=`echo ${files%/*} | sed 's/archive//'`
    head_commit=($(git ls-remote ${git_url} | sed 's/archive//' | grep HEAD))
    sed -i "/^version/ s/\".*\"/\"${head_commit}\"/" ${pkg_path}

    # Update archive hash
    archive_url="${files%/*}/${head_commit}.tar.gz"
    echo "Downloading new tarball $archive_url"
    curl -s -L -O "$archive_url"
    sha256_tarball=($(sha256sum ${head_commit}.tar.gz))
    sed -i "/^archive_hash/s/\".*\"/\"${sha256_tarball}\"/" ${pkg_path}
    rm -f "${head_commit}.tar.gz"
    echo "${pkg_path} has been updated"
done
