#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-tic80
version="3d0780ef6e2d37a7f18477f71e331e8c624ceab9"
workdir="${port/libretro-tic80/TIC-80}-${version}"
archive_hash="4c042cb5732a466d6714708ff91db7ce368d64b0df542634b27e64e56ef91f1e"
files=(
    "https://github.com/nesbox/${port/libretro-tic80/TIC-80}/archive/${version}.tar.gz#$archive_hash"
    "https://github.com/cofyc/argparse/archive/0d5f5d0745df14a3f373f7eed85bf524714f4524.tar.gz#b14cfe4b95a4cd1cf148eeecf0dba94ebf5b4312de12f5f5254e7040017477f1"
    "https://github.com/nesbox/blip-buf/archive/330226d9b55ecbeea644e17b5e0f096a165ca07e.tar.gz#e86870ecb4b7c3feac6afbf5ddd0aff809e14b2d16d9bde251b712fd4ecd6d99"
    "https://github.com/nesbox/giflib/archive/1aa11b06d0025eda77b56aec8254130654d4397b.tar.gz#0061d8b362e1edce6d47c2cf6df218c3d7d4494bacae98d2f0552b8bb1ebc319"
    "https://github.com/glennrp/libpng/archive/ed217e3e601d8e462f7fd1e04bed43ac42212429.tar.gz#3179215477e554acc3630b8a508488ade049a359c75253e377e136add1252c9d"
    "https://github.com/nesbox/lpeg/archive/73d8614a8dea404cf7bfe25a6e4cea7183dc9fb7.tar.gz#600d8644b51e5cb4d628627cd430d7beccf1d5af72a2844270983c85563de3a4"
    "https://github.com/lua/lua/archive/75ea9ccbea7c4886f30da147fb67b693b2624c26.tar.gz#9f2f625653b8a6ce9e4489385370256831e71fe2fc15801d9b738aadde45e98d"
    "https://github.com/nesbox/moonscript/archive/17179283012b392bff972ad66231d73bfeec6e90.tar.gz#10f0ebf82ae92a1389d353b349bef25deea594aebb3a65d09f36cd1193d7de18"
    "https://github.com/albertodemichelis/squirrel/archive/9dcf74f99097898dd5a111c4a55b89d1c4d606c0.tar.gz#3516851095b32b812c2821ce28357bf5a533efebb6baee8276d106d4974088a3"
    "https://github.com/wasm3/wasm3/archive/139076a98b8321b67f850a844f558b5e91b5ac83.tar.gz#ae1107ad77365a6e5e3ec10c915cc3873fdd91d8e02c41d32ae6e0707ed3760b"
    "https://github.com/wren-lang/wren/archive/4a18fc489f9ea3d253b20dd40f4cdad0d6bb40eb.tar.gz#fb885f12767ea8b1101145b9d86735995e28c5298b712c1c3f71ed9bbf17f567"
    "https://github.com/kuba--/zip/archive/d7df626f3aa457e01669f65e61bf8f484e352941.tar.gz#f121ff9a6df3414afe958c341c0e3f05d638e43e3be735a9dad8d05ce9322c49"
    "https://github.com/madler/zlib/archive/51b7f2abdade71cd9bb0e7a373ef2610ec6f9daf.tar.gz#d9e270d46252734aa49770fbc544125391617956266f220bd63216c834f3a522"
)

useconfigure=true
configopts=(
    "-DCMAKE_TOOLCHAIN_FILE=${SERENITY_BUILD_DIR}/CMakeToolchain.txt" 
    "-DCMAKE_BUILD_TYPE=Release"
    "-DBUILD_DEMO_CARTS=OFF"
    "-DBUILD_LIBRETRO=ON"
    "-DBUILD_PLAYER=OFF"
    "-DBUILD_SDL=OFF"
    "-DBUILD_SOKOL=OFF"
    "-DBUILD_WITH_MRUBY=OFF"
)

configure() {
    # Initialize submodules from tarballs
    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/argparse" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/argparse"
    cp -r argparse-0d5f5d0745df14a3f373f7eed85bf524714f4524/ "${port/libretro-tic80/TIC-80}-${version}/vendor/argparse"
    
    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/blip-buf" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/blip-buf"
    cp -r blip-buf-330226d9b55ecbeea644e17b5e0f096a165ca07e/ "${port/libretro-tic80/TIC-80}-${version}/vendor/blip-buf"

    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/giflib" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/giflib"
    cp -r giflib-1aa11b06d0025eda77b56aec8254130654d4397b/ "${port/libretro-tic80/TIC-80}-${version}/vendor/giflib"
    
    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/libpng" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/libpng"
    cp -r libpng-ed217e3e601d8e462f7fd1e04bed43ac42212429/ "${port/libretro-tic80/TIC-80}-${version}/vendor/libpng"

    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/lpeg" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/lpeg"
    cp -r lpeg-73d8614a8dea404cf7bfe25a6e4cea7183dc9fb7/ "${port/libretro-tic80/TIC-80}-${version}/vendor/lpeg"
    
    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/lua" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/lua"
    cp -r lua-75ea9ccbea7c4886f30da147fb67b693b2624c26/ "${port/libretro-tic80/TIC-80}-${version}/vendor/lua"
    
    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/moonscript" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/moonscript"
    cp -r moonscript-17179283012b392bff972ad66231d73bfeec6e90/ "${port/libretro-tic80/TIC-80}-${version}/vendor/moonscript"
    
    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/squirrel" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/squirrel"
    cp -r squirrel-9dcf74f99097898dd5a111c4a55b89d1c4d606c0/ "${port/libretro-tic80/TIC-80}-${version}/vendor/squirrel"

    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/wasm3" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/wasm3"
    cp -r wasm3-139076a98b8321b67f850a844f558b5e91b5ac83/ "${port/libretro-tic80/TIC-80}-${version}/vendor/wasm3"
    
    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/wren" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/wren"
    cp -r wren-4a18fc489f9ea3d253b20dd40f4cdad0d6bb40eb/ "${port/libretro-tic80/TIC-80}-${version}/vendor/wren"

    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/zip" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/zip"
    cp -r zip-d7df626f3aa457e01669f65e61bf8f484e352941/ "${port/libretro-tic80/TIC-80}-${version}/vendor/zip"

    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/zlib" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/zlib"
    cp -r zlib-51b7f2abdade71cd9bb0e7a373ef2610ec6f9daf/ "${port/libretro-tic80/TIC-80}-${version}/vendor/zlib"

    run cmake "${configopts[@]}"
}

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp lib/${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
