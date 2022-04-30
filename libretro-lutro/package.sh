#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-lutro
version="cc6b06db98bcb7d0379082a876fed870e203ccb3"
workdir="${port}-${version}"
archive_hash="939561ab7b2cab444de7158b8f402c05c020e9fd1e6919457ac92209f7d0d6a8"
files="https://github.com/libretro/${port}/archive/${version}.tar.gz ${port}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
