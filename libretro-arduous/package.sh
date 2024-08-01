#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-arduous
version="50c1e48084f003dee582ed5f4f5c0f59eb30bc4c"
workdir="${port/libretro-/}-${version}"
files=(
    "https://github.com/${port/-arduous/}/${port/libretro-/}/archive/${version}.tar.gz#9e261468f9cbb41a729109447435880cdff775fbd5c26d2118b12b12047327b9"
    "https://github.com/buserror/simavr/archive/e2023d1a5bfd448fb42df343ce56c1fc9637a794.tar.gz#eb142c8125b43d67a42a4aaa3751a9e0a9b07bfad35c6b7fe5650c45304a8860"
)
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
