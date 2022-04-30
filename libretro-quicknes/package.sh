#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-quicknes
version="e6f08c165af45fc2d2f26c80ba0cfc33e26f9cfe"
workdir="QuickNES_Core-${version}"
archive_hash="ae6a40b32f286536edbd697f13a849f658ba2ae2643f43c3f8bedfa12bdc73be"
files="https://github.com/libretro/${port/libretro-/}_core/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
