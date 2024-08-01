#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-gearsystem
version="59087fb1f8b77c3c151df4aeb03cc44821db6112"
workdir="Gearsystem-${version}"
archive_hash="4d350954c92dbfa62a8d7117bfa239eb6c26f81d498339650565ea946a2b71da"
files="https://github.com/drhelius/${port/libretro-/}/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make -C platforms/libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp platforms/libretro/${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
