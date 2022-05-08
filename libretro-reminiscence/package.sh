#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-reminiscence
version="c2624c7565bbae441835db80f24902fc40f83dd1"
workdir="REminiscence-${version}"
archive_hash="a8c11ff40c0f6718b7932bcaf15899cacbf7e9b2b95bea019ffc070ffa895380"
files="https://github.com/libretro/REminiscence/archive/${version}.tar.gz REminiscence-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
