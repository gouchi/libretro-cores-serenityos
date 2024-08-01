#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-gong
version="11d98233f9bba2dec60cae555b196684fd9d2aa5"
workdir="${port/libretro-/}-${version}"
archive_hash="cdd3aed94a2a811cc26dfc8b1c2b4f8c6b78a94b9f4f8792f0a72402f2e79610"
files="https://github.com/libretro/${port/libretro-/}/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make -f Makefile.libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
