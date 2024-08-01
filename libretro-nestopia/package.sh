#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-nestopia
version="be1139ec4d89151fc65b81a3494d2b9c0fd0b7dc"
workdir="${port/libretro-/}-${version}"
archive_hash="f0b1d21d7b0a4998db8b07669c0229db049ec88a8f0000aec3ed72bdc8807227"
files="https://github.com/libretro/${port/libretro-/}/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make -C libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp libretro/${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
