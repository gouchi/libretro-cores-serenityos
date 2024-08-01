#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-quicknes
version="89d649a544e7d37a5cdbc77c811e88753fa23131"
workdir="QuickNES_Core-${version}"
archive_hash="97239265ecf76157b4f883a46638303d230c611a3eb0059268b754fd06738965"
files="https://github.com/libretro/${port/libretro-/}_core/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
