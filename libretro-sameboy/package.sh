#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-sameboy
version="51433012a871a44555492273fd22f29867d12655"
workdir="SameBoy-${version}"
archive_hash="cb1b914ce29d250ed1b170b317c114106bdd9208d69100f3f761eeddd5fb472d"
files="https://github.com/libretro/${port/libretro-/}/archive/${version}.tar.gz#$archive_hash"
auth_type=sha256

build() {
    run make -C libretro "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp libretro/${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
