#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-nxengine
version="11fc0892dc6b99b36ecf318006834932cd5b817a"
workdir="${port/libretro-/}-libretro-${version}"
archive_hash="6352c3ba9c27e5d106953f1078154aaf86f55bd344c1047b27d7f04575f7c506"
files="https://github.com/libretro/${port/libretro-/}-libretro/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
