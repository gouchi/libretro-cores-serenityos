#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-nxengine
version="fc102fa3eeda1a0133f80474d6671af4cf7612a6"
workdir="${port/libretro-/}-libretro-${version}"
archive_hash="46bf795d6ef7626681dcc4d659934b6f99f332562d00e42e1f101882eeb3e045"
files="https://github.com/libretro/${port/libretro-/}-libretro/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
