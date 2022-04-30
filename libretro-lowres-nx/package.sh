#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-lowres-nx
version="726016d37bc7b18e6e2fac0140b7d85b19374c7e"
workdir="${port/libretro-/}-${version}"
archive_hash="466ccae79c1d2d1037cbde78816e45bc977990383fd2df636d6656bf0586178b"
files="https://github.com/timoinutilis/${port/libretro-/}/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make -C platform/LibRetro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp platform/LibRetro/lowresnx_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
