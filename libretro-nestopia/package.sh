#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-nestopia
version="a9e197f2583ef4f36e9e77d930a677e63a2c2f62"
workdir="${port/libretro-/}-${version}"
archive_hash="1372bb29a02c4366039479d1115c890d84cddd07fa443843050692435c3876cb"
files="https://github.com/libretro/${port/libretro-/}/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make -C libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp libretro/${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
