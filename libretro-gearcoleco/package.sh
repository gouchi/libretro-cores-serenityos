#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-gearcoleco
version="8c7d6436a9e0aea87233d0a16a6c6910767a841e"
workdir="Gearcoleco-${version}"
archive_hash="a79165753b116c246122a4a224882bb60dc769ae8ca83fa6c07c17e4b662744c"
files="https://github.com/drhelius/${port/libretro-/}/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make -C platforms/libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp platforms/libretro/${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
