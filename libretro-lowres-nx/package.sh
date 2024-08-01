#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-lowres-nx
version="c824ec163a1945cc48e4319054c7eb1024667497"
workdir="${port/libretro-/}-${version}"
archive_hash="73de1c204ad8323b597f2013e99e8bced8e37401b67b9f844769c1ab0c8e0ceb"
files="https://github.com/timoinutilis/${port/libretro-/}/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make -C platform/LibRetro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp platform/LibRetro/lowresnx_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
