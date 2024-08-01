#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-vbam
version="e4ef4aa625c45aa2c1aae07d5472e6b3f48e70f6"
workdir="visualboyadvance-m-${version}"
archive_hash="79a77b5613bda04713e558d0bb9e62eebd717f26691eee9cfe2830ba593010fa"
files=(
    "https://github.com/visualboyadvance-m/visualboyadvance-m/archive/${version}.tar.gz#$archive_hash"
    "https://github.com/visualboyadvance-m/dependencies/archive/e8ce758a98161d47559aa294d3298425ec75e28e.tar.gz#ccd1cca3593795d8cdf59c281db057a71123e6fe38594697f3c4435fa6c00dd1"
)
useconfigure=true

configure() {
    # Initialize submodules from tarballs
    [ -e "${workdir}/dependencies" ] && rm -rf "${workdir}/dependencies"
    cp -r dependencies-e8ce758a98161d47559aa294d3298425ec75e28e "${workdir}/dependencies"
}

build() {
    run make -C src/libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp src/libretro/${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
