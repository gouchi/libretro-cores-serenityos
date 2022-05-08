#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-handy
version="517bb2d02909271836604c01c8f09a79ad605297"
archive_hash="9cb28a26aee3b1ce503458ec3fb954a3464fdd41f1a1acb1e6c93426b2c2f9f0"
files="https://github.com/libretro/${port}/archive/${version}.tar.gz ${port}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
