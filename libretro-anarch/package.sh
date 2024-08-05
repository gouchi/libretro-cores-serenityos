#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-anarch
version="d1fd89f01fd1604235589d13a10beca3603be9f6"
workdir="anarch-libretro"
archive_hash="e9dbb055233cf67380fe7a088bc8847cc8746d5be7210681aeb1989743202ad2"
files=(
    "https://codeberg.org/iyzsong/anarch-libretro/archive/${version}.tar.gz#$archive_hash"
)

useconfigure=true
configopts=(
    "-DCMAKE_TOOLCHAIN_FILE=${SERENITY_BUILD_DIR}/CMakeToolchain.txt" 
    "-DCMAKE_BUILD_TYPE=Release"
)

configure() {
   run cmake "${configopts[@]}"
}

build() {
    run make "${makeopts[@]}"
}

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp anarch_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}

