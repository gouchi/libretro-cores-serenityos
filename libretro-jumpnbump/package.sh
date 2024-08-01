#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-jumpnbump
version="4e68831f5576075c45c147f86865812afb816139"
workdir="${port/libretro-/}-libretro-${version}"
archive_hash="3663beddd81e56fde9d41a21d832987922e4b70ad10291b87e271ae6b3a24da9"
files="https://github.com/libretro/${port/libretro-/}-libretro/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
