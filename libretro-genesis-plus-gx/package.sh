#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-genesix-plus-gx
version="2fd18851754e715bd55e7040aaace2590ac0d8cb"
workdir="Genesis-Plus-GX-${version}"
archive_hash="34fce67bc5f52eef99dd58e0a9a80f543447ab8955e724cd9b1af5ccbcf59a27"
files="https://github.com/ekeeke/Genesis-Plus-GX/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make -f Makefile.libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp genesis_plus_gx_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
