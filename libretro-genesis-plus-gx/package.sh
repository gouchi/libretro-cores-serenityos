#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-genesix-plus-gx
version="e366ca817f5b750ad06a8e2c5976d79b3758ea0a"
workdir="Genesis-Plus-GX-${version}"
archive_hash="d38444befbd5c7785c87900cfbedc6625b2e59a60521a4c760f51113161acbf4"
files="https://github.com/ekeeke/Genesis-Plus-GX/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make -f Makefile.libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp genesis_plus_gx_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
