#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-arduous
version="42b4fe77d676fb78338a6962713144234f4d563b"
workdir="${port/libretro-/}-${version}"
files="https://github.com/${port/-arduous/}/${port/libretro-/}/archive/${version}.tar.gz ${port}-${version}.tar.gz
https://github.com/buserror/simavr/archive/e2023d1a5bfd448fb42df343ce56c1fc9637a794.tar.gz simavr.tar.gz"

useconfigure=true
configopts=("-DCMAKE_TOOLCHAIN_FILE=${SERENITY_BUILD_DIR}/CMakeToolchain.txt" "-DCMAKE_BUILD_TYPE=Release")

configure() {
    # Initialize submodules from tarballs
    [ -e "${port/libretro-/}-${version}/simavr" ] && rm -r "${port/libretro-/}-${version}/simavr"
    cp -r simavr-e2023d1a5bfd448fb42df343ce56c1fc9637a794 "${port/libretro-/}-${version}/simavr"

    run cmake "${configopts[@]}"
}

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
