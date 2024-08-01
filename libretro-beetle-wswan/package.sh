#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-beetle-wswan
version="440e9228592a3f603d7d09e8bee707b0163f545f"
workdir="beetle-wswan-libretro-${version}"
archive_hash="1aca66df34c78c889ff3c707918b74082991bc07a1a7c4a150a0208fb62cb8e6"
files="https://github.com/libretro/beetle-wswan-libretro/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp mednafen_wswan_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
