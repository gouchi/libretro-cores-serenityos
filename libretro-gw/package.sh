#!/usr/bin/env -S bash ../.port_include.sh
port=gw-libretro
version="d08a08154ce8ed8e9de80582c108f157e4c6b226"
workdir="$port-${version}"
archive_hash="6c48bde1ab3cea5d9273303c79d5e044ed05024c0191a747d7b79efe677b4271"
files="https://github.com/libretro/$port/archive/${version}.tar.gz ${port}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make -f Makefile.libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/-/_}.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
