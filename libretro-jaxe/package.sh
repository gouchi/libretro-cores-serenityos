#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-jaxe
version="84862432dcaf5cb0b68ecf45921dfaabdb56d3fd"
workdir="${port/libretro-/}-${version}"
files="https://github.com/kurtjd/${port/libretro-/}/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz
https://github.com/libretro/libretro-common/archive/996376e36d3f4f56eba202cb96230568628d2583.tar.gz libretro-common.tar.gz"
useconfigure=true

configure () {
    # Initialize submodules from tarballs
    [ -e "${port/libretro-/}-${version}/src/deps/libretro-common" ] && rm -r "${port/libretro-/}-${version}/src/deps/libretro-common"
    cp -r libretro-common-996376e36d3f4f56eba202cb96230568628d2583/ "${port/libretro-/}-${version}/src/deps/libretro-common"
}

build() {
    run make -f Makefile.libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
