#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-beetle-wswan
version="d1fb3f399a2bc16b9ad0f2e8c8ba9f7051cd26bd"
workdir="beetle-wswan-libretro-${version}"
archive_hash="18df2d0810705c09a00948d311b2e147e32ea9d0e3cdc1e860b434dac19e8f45"
files="https://github.com/libretro/beetle-wswan-libretro/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp mednafen_wswan_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
