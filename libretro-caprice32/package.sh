#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-cap32
version="8ac298b5770dc9ba5cace9cb61e714c57318ba59"
archive_hash="d0d5f851a1f73489b5db2e401b5165ecd1a82bb1496e5ce52a4dbdc0df32c0c9"
files="https://github.com/libretro/${port}/archive/${version}.tar.gz ${port}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
