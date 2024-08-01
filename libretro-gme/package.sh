#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-gme
version="a469ce3f6e9cc674e615de3955ec7b25e949e5d8"
workdir="${port}-${version}"
archive_hash="9d997316c05f9cb0788ca508d24e84ed03d7217f6fdc1e0141158d47a83d5a8a"
files="https://github.com/libretro/${port}/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
