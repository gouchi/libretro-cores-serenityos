#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-cannonball
version="8fb0d9561ee110f31f45610661649f0c1ff068ee"
workdir="${port/libretro-/}-${version}"
archive_hash="04c4789fc4c8433db8649654ecc59d84a8a7422b3b2e53892b0ca7febbe2c05c"
files="https://github.com/libretro/${port/libretro-/}/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
