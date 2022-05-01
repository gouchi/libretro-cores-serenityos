#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-gearcoleco
version="443207ea3cf3df75299f3346692b873189c44183"
workdir="Gearcoleco-${version}"
archive_hash="97dd3eb67c5388431d6ecfb7b54842d753520a489abb3e3529d349cdc8431d5a"
files="https://github.com/drhelius/${port/libretro-/}/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make -C platforms/libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp platforms/libretro/${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
