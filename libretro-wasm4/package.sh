#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-wasm4
version="a190ee119c572f10e14ce73188348c2bf00d333e"
workdir="${port/libretro-/}-${version}"
files="https://github.com/aduros/${port/libretro-/}/archive/${version}.tar.gz ${port}-${version}.tar.gz
https://github.com/wasm3/wasm3/archive/dc9fa49340b8d066a479cf36f7412208ff91a0ee.tar.gz wasm3.tar.gz"
useconfigure=true
configopts=("-DCMAKE_TOOLCHAIN_FILE=${SERENITY_BUILD_DIR}/CMakeToolchain.txt" "-DLIBRETRO=on" "-DCMAKE_BUILD_TYPE=Release")

configure() {
    # Initialize submodules from tarballs
    [ -e "${port/libretro-/}-${version}/runtimes/native/vendor/wasm3" ] && rm -r "${port/libretro-/}-${version}/runtimes/native/vendor/wasm3"
    cp -r wasm3-dc9fa49340b8d066a479cf36f7412208ff91a0ee/ "${port/libretro-/}-${version}/runtimes/native/vendor/wasm3"

    run cmake "runtimes/native" "${configopts[@]}"
}

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
