#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-gong
version="4dbe23494173b93322d1033da54aa36cb2b23be7"
workdir="${port/libretro-/}-${version}"
archive_hash="5fbe8852bf12f6c471f3f729cb1f8117553d54b7a70cc271aea4f543757135d7"
files="https://github.com/libretro/${port/libretro-/}/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make -f Makefile.libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
