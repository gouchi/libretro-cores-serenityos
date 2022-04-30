#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-dinothawr
version="33fb82a8df4e440f96d19bba38668beaa1b414fc"
workdir="Dinothawr-${version}"
archive_hash="092c5c97b73605747baa4cfb3156c7ff80ba2128618ee1cc4d8f12900a0d374b"
files="https://github.com/libretro/${port/libretro-/}/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
