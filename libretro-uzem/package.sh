#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-uzem
version="08e39e19167727c89fb995e3fa70dde252e6aab0"
archive_hash="a0c84adb7db92826c4cf1c2175972e9d04932d7e88462351669f8ada37cb21bd"
files="https://github.com/libretro/${port}/archive/${version}.tar.gz ${port}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
