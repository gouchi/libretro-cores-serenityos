#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-lutro
version="09a134eccad87127ec757503f736d6e4f9d06d4c"
workdir="${port}-${version}"
archive_hash="770cbc75eea59874d8a63a107cdc8651edd6bac69f1d542b3f1c0b4e4c475894"
files="https://github.com/libretro/${port}/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
