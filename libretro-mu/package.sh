#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-mu
version="d7dd7e2a33ba405b0794c2931ddc6c2d75e59d36"
workdir="${port/libretro-m/M}-${version}"
archive_hash="21d6d1fb7d539d85ec65112377f13658a1a4b640419e86cf362d4da4c6b77d72"
files="https://github.com/libretro/${port/libretro-/}/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make -C libretroBuildSystem "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp libretroBuildSystem/${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
