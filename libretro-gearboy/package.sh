#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-gearboy
version="d729e3b53b4a1a09e5972fc53b94175d5c8ddc7e"
workdir="Gearboy-${version}"
archive_hash="c2f25dda8ad4be7d4f6e6765188b7ee528c4e1cf89a3849c1572064126b9970c"
files="https://github.com/drhelius/${port/libretro-/}/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make -C platforms/libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp platforms/libretro/${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
