#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-reminiscence
version="b7c3ff91ada2e49fa5ee5af2b139e6cc0ce6bf24"
workdir="REminiscence-${version}"
archive_hash="d282cbe400c5aaa8df4d52be5066c771294cb067edc800b94e0cdb8785d0dd58"
files="https://github.com/libretro/REminiscence/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp ${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
