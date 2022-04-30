#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-snes9x
version="bc65c09c280cb225084099385375d3b513a43455"
workdir="${port/libretro-/}-${version}"
archive_hash="b5a2e4e1663e140bb0503b3d32d31da9428e9dd66a08d249c6a41aecb7bf71f2"
files="https://github.com/libretro/${port/libretro-/}/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make -C libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp libretro/${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
