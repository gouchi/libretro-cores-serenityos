#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-beetle-pce-fast
version="e8801687f232a6f8828b3ff5dadbc9fe1b0076fc"
workdir="beetle-pce-fast-libretro-${version}"
archive_hash="6ba8965da9f27ca1feb4a6406e6f3114f60712e8ddd8778847885a289b893f00"
files="https://github.com/libretro/beetle-pce-fast-libretro/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make HAVE_CDROM=0 "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp mednafen_pce_fast_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
