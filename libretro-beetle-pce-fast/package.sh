#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-beetle-pce-fast
version="7b7ad0760860f792f3f3a2768230397504e3f66d"
workdir="beetle-pce-fast-libretro-${version}"
archive_hash="b6ad7017658bd050ee8f18763716c3567c7d5106fc9dcf1c337bb1cd149bc11a"
files="https://github.com/libretro/beetle-pce-fast-libretro/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make HAVE_CDROM=0 "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp mednafen_pce_fast_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
