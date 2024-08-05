#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-2048
version="5474ed1ab880b3296c9860d0943d7de1970c79dd"
workdir="${port}-${version}"
archive_hash="d0dc119024c4b3283a85c88896009b917a4350f90fd783fd73bf3788c9d8a199"
files="https://github.com/${port/-2048/}/${port}/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make -f Makefile.libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp 2048_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
