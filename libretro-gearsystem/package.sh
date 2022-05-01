#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-gearsystem
version="a6849bfa6973af6417678d9b1ea893064aa3910c"
workdir="Gearsystem-${version}"
archive_hash="7eff52d6ac116305b899ed2024e6105244b67fd467505b1ac0da9fbfc56b888a"
files="https://github.com/drhelius/${port/libretro-/}/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make -C platforms/libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp platforms/libretro/${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
