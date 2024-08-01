#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-cap32
version="bae879df46f7f22951efda256c19b1692b77ef3e"
archive_hash="3511fe3ded140e3122957c0e831dc243e9d5071505b77b4b75368c0a0760c919"
files="https://github.com/libretro/${port}/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
