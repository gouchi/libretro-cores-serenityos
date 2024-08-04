#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-ardens
version="59e456d07cdac9ae2e48ce356374e5bd02636204"
workdir="Ardens-${version}"
archive_hash="d0714f451fe80a9d25b56ca5492954bb419c18694f0a104f7726b19962550f3e"
files=(
    "https://github.com/tiberiusbrown/${port/libretro-/}/archive/${version}.tar.gz#$archive_hash"
    "https://github.com/richgel999/miniz/archive/293d4db1b7d0ffee9756d035b9ac6f7431ef8492.tar.gz#27d99216e9127d1678085639f3059f6907a02c044e8a38392a39f96163ddbbf0"
)

useconfigure=true
configopts=(
    "-DCMAKE_TOOLCHAIN_FILE=${SERENITY_BUILD_DIR}/CMakeToolchain.txt" 
    "-DCMAKE_BUILD_TYPE=Release"
    "-DARDENS_LIBRETRO=ON"
)

configure() {
    # Initialize submodules from tarballs
    [ -e "${workdir}/deps/miniz" ] && rm -r "${workdir}/deps/miniz"
    cp -r miniz-293d4db1b7d0ffee9756d035b9ac6f7431ef8492/ "${workdir}/deps/miniz"
    
   run cmake "${configopts[@]}"
}

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
