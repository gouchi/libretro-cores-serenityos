#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-fbneo
version="100c758b1a9b3b647234174b0b1607c8d60cd147"
workdir="FBNeo-${version}"
archive_hash="3ff7ddf1cf6c02582da5112f0a08aad644cb6f1b06508149c1f62da96a65c017"
files="https://github.com/libretro/${port/libretro-/}/archive/${version}.tar.gz ${port}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make -C src/burner/libretro profile=accuracy "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp src/burner/libretro/${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
}
