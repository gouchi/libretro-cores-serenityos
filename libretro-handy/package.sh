#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-handy
version="15d3c87e0eba52464ed759d3702d7cb7fdd0d7e0"
archive_hash="ab90f90e73ddb58957d83f3b312b4add60e7e81890255e265a652a409fe515d6"
files="https://github.com/libretro/${port}/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
