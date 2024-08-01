#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-wasm4
version="49e630396649d435a1a0b8c1eaa52cc5ce8a70a8"
workdir="${port/libretro-/}-${version}"
archive_hash="849815d22cd8e0beebe4978c9aa5460f8b365afad64c95f99997f579d5d8a4bf"
files=(
    "https://github.com/aduros/${port/libretro-/}/archive/${version}.tar.gz#$archive_hash"
    "https://github.com/wasm3/wasm3/archive/dc9fa49340b8d066a479cf36f7412208ff91a0ee.tar.gz#253c42d8afd6f940872d7bd10345b9e42dba0b97b5817de1e0d21654db06f2ff"
)
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
