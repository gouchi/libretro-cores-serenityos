#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-fbneo
version="6fbc30a830c54304c16ba7dccd3aca2cb30bb473"
workdir="FBNeo-${version}"
archive_hash="6d73401ce1c511e8d9afbe1ef60200df7dcc1c23464aeb66cf23711a61737e19"
files="https://github.com/libretro/${port/libretro-/}/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make -C src/burner/libretro profile=accuracy "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp src/burner/libretro/${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
}
