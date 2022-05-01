#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-sameboy
version="b154b7d3d885a3cf31203f0b8f50d3b37c8b742b"
workdir="SameBoy-${version}"
archive_hash="a8728627d7343abc097d74ff0a0f7ad6ebb5d5b70aba1f7ff81b73ce8f192806"
files="https://github.com/libretro/${port/libretro-/}/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make -C libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp libretro/${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
