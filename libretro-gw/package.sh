#!/usr/bin/env -S bash ../.port_include.sh
port=gw-libretro
version="feab76c102166784230dc44c45cad4cb49a1c9a7"
workdir="$port-${version}"
archive_hash="83f99a06e2dfd5dc4127f552e924f2727a30c52ab49552f81da1da186b8cc9da"
files=(
    "https://github.com/libretro/$port/archive/${version}.tar.gz#$archive_hash"
)

build() {
    run make -f Makefile.libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/-/_}.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
