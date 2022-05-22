#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-fceumm
version="b3c35b6515b2b6a789c589f976a4a323ebebe3eb"
archive_hash="6ae6816f4d6c6c765fd49ae2dad639d867d82781825535428565e43611649339"
files="https://github.com/libretro/${port}/archive/${version}.tar.gz ${port}-${version}.tar.gz $archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
