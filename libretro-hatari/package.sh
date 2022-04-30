#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-hatari
version="e5e36a5262cfeadc3d1c7b411b7a70719c4f293c"
workdir="${port/libretro-/}-${version}"
archive_hash="e1cc4f96d5ddedc70dcf59a73f05a6c6da476bbe7b2a9672fa3f8d09f4743925"
files="https://github.com/libretro/${port/libretro-/}/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make -f Makefile.libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
