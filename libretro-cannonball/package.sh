#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-cannonball
version="fb2a341b9c17bab44941495fa5568f7f0f66f92a"
workdir="${port/libretro-/}-${version}"
archive_hash="00a223d2ce1e0b4c1d3bef0235b327ed910e4bf1ef95114b4522f6b70ae49d0a"
files="https://github.com/libretro/${port/libretro-/}/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
