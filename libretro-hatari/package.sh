#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-hatari
version="c10a21dbe99277b06ccf7de10eceb74f5d57e921"
workdir="${port/libretro-/}-${version}"
archive_hash="6663c38c83590cddc67e49bdb3dff51a858e9caff412243eb96ed241b2878a13"
files="https://github.com/libretro/${port/libretro-/}/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make -f Makefile.libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
