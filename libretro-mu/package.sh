#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-mu
version="1361da04014d77b8bec13e050a71bf7bf8ce5543"
workdir="${port/libretro-m/M}-${version}"
archive_hash="2327104d3ce453eff17fed1106290dd1f894b5bdd4e4adfc1b811001a500c4c8"
files="https://github.com/libretro/${port/libretro-/}/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make -C libretroBuildSystem "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp libretroBuildSystem/${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
