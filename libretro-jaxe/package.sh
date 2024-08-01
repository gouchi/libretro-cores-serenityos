#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-jaxe
version="22115d58de5f80cfafbbeece19d723f4892ed75c"
workdir="${port/libretro-/}-${version}"
archive_hash="b66f1942824e61b73b7254a96644f87b934b949dccf4c291dd3957b1994424ed"
files=(
    "https://github.com/kurtjd/${port/libretro-/}/archive/${version}.tar.gz#$archive_hash"
    "https://github.com/libretro/libretro-common/archive/996376e36d3f4f56eba202cb96230568628d2583.tar.gz#9451d8775f9660057b4703822b74307550c202773071ee0ff601738d5e1683fa"
)
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
