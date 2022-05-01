#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-gearboy
version="2cb66cdcb05f77147b9a5941e8ab92bceea828ae"
workdir="Gearboy-${version}"
archive_hash="84d61bb13f71dd280ac7158ca19c4befac302276aec4bca56d69a5d218b67c07"
files="https://github.com/drhelius/${port/libretro-/}/archive/${version}.tar.gz ${port/libretro-/}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make -C platforms/libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp platforms/libretro/${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
