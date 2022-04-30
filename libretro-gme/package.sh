#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-gme
version="5fb30ebb8871624cecc07813212fb643fa8449f4"
workdir="${port}-${version}"
archive_hash="ea4394c28fd63b3b1f8ca2e7aa83ad4a14fb360815e4d593065466712769550a"
files="https://github.com/libretro/${port}/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
