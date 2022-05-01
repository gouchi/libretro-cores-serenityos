#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-jumpnbump
version="5fd1a7c7757d2a73d8a49578155f0302d7794ac2"
workdir="${port/libretro-/}-libretro-${version}"
archive_hash="f7c48f449406869eb1d357718594c9d3bfe22b50b2bb733e668162e93a1609f6"
files="https://github.com/libretro/${port/libretro-/}-libretro/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
