#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-vbam
version="732524a77b050bdcc5ab347ef371ed25cd01e09d"
workdir="visualboyadvance-m-${version}"
files="https://github.com/visualboyadvance-m/visualboyadvance-m/archive/${version}.tar.gz ${port}-${version}.tar.gz
https://github.com/visualboyadvance-m/dependencies/archive/a39ddbb983b6ca42bd328f4eb3119b1d507f1019.tar.gz dependencies.tar.gz"
useconfigure=true

configure() {
    # Initialize submodules from tarballs
    [ -e "${workdir}/dependencies" ] && rm -rf "${workdir}/dependencies"
    cp -r dependencies-a39ddbb983b6ca42bd328f4eb3119b1d507f1019 "${workdir}/dependencies"
}

build() {
    run make -C src/libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp src/libretro/${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
