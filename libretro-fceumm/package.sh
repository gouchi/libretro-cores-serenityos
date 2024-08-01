#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-fceumm
version="744f5d9c8b976a431dcb5417a520c0c709b17fbe"
archive_hash="bead6e9e9d9a35ea86bd42d401019808e4304aadb30ff88d12dcbda1cd8003d5"
files="https://github.com/libretro/${port}/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
