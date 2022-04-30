#!/usr/bin/env -S bash ../.port_include.sh
port=libretro-tic80
version="263b3213f90362fd427d9f8a281698f5fe7284a6"
workdir="${port/libretro-tic80/TIC-80}-${version}"
files="https://github.com/nesbox/${port/libretro-tic80/TIC-80}/archive/${version}.tar.gz ${port}-${version}.tar.gz
https://github.com/cofyc/argparse/archive/0d5f5d0745df14a3f373f7eed85bf524714f4524.tar.gz argparse.tar.gz
https://github.com/nesbox/blip-buf/archive/330226d9b55ecbeea644e17b5e0f096a165ca07e.tar.gz blip-buf.tar.gz
https://github.com/svaarala/duktape-releases/archive/28f915a5381ca3a7dfa22130d08fbc5a16ae5d2f.tar.gz duktape.tar.gz
https://github.com/nesbox/giflib/archive/1aa11b06d0025eda77b56aec8254130654d4397b.tar.gz giflib.tar.gz
https://github.com/nodejs/http-parser/archive/ec8b5ee63f0e51191ea43bb0c6eac7bfbff3141d.tar.gz http-parser.tar.gz
https://github.com/glennrp/libpng/archive/dbe3e0c43e549a1602286144d94b0666549b18e6.tar.gz libpng.tar.gz
https://github.com/libuv/libuv/archive/9c3d692b3941a2a4171629fb52af2e1029c415e8.tar.gz libuv.tar.gz
https://github.com/nesbox/lpeg/archive/73d8614a8dea404cf7bfe25a6e4cea7183dc9fb7.tar.gz lpeg.tar.gz
https://github.com/lua/lua/archive/75ea9ccbea7c4886f30da147fb67b693b2624c26.tar.gz lua.tar.gz
https://github.com/nesbox/moonscript/archive/17179283012b392bff972ad66231d73bfeec6e90.tar.gz moonscript.tar.gz
https://github.com/albertodemichelis/squirrel/archive/9dcf74f99097898dd5a111c4a55b89d1c4d606c0.tar.gz squirrel.tar.gz
https://github.com/wasm3/wasm3/archive/a3abb3f2d320994be59dfbe2cdafa8d0b6a8253e.tar.gz wasm3.tar.gz
https://github.com/wren-lang/wren/archive/4a18fc489f9ea3d253b20dd40f4cdad0d6bb40eb.tar.gz wren.tar.gz
https://github.com/kuba--/zip/archive/d7df626f3aa457e01669f65e61bf8f484e352941.tar.gz zip.tar.gz
https://github.com/madler/zlib/archive/cacf7f1d4e3d44d871b605da3b647f07d718623f.tar.gz zlib.tar.gz
"
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

    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/duktape" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/duktape"
    cp -r duktape-releases-28f915a5381ca3a7dfa22130d08fbc5a16ae5d2f/ "${port/libretro-tic80/TIC-80}-${version}/vendor/duktape"
    
    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/giflib" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/giflib"
    cp -r giflib-1aa11b06d0025eda77b56aec8254130654d4397b/ "${port/libretro-tic80/TIC-80}-${version}/vendor/giflib"
    
    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/http-parser" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/http-parser"
    cp -r http-parser-ec8b5ee63f0e51191ea43bb0c6eac7bfbff3141d/ "${port/libretro-tic80/TIC-80}-${version}/vendor/http-parser"
    
    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/libpng" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/libpng"
    cp -r libpng-dbe3e0c43e549a1602286144d94b0666549b18e6/ "${port/libretro-tic80/TIC-80}-${version}/vendor/libpng"

    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/libuv" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/libuv"
    patch -d libuv-9c3d692b3941a2a4171629fb52af2e1029c415e8 -p1 < patch-libuv/0002-fs-Stub-out-unsupported-syscalls.patch
    cp -r libuv-9c3d692b3941a2a4171629fb52af2e1029c415e8/ "${port/libretro-tic80/TIC-80}-${version}/vendor/libuv"
    
    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/lpeg" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/lpeg"
    cp -r lpeg-73d8614a8dea404cf7bfe25a6e4cea7183dc9fb7/ "${port/libretro-tic80/TIC-80}-${version}/vendor/lpeg"
    
    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/lua" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/lua"
    cp -r lua-75ea9ccbea7c4886f30da147fb67b693b2624c26/ "${port/libretro-tic80/TIC-80}-${version}/vendor/lua"
    
    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/moonscript" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/moonscript"
    cp -r moonscript-17179283012b392bff972ad66231d73bfeec6e90/ "${port/libretro-tic80/TIC-80}-${version}/vendor/moonscript"
    
    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/squirrel" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/squirrel"
    cp -r squirrel-9dcf74f99097898dd5a111c4a55b89d1c4d606c0/ "${port/libretro-tic80/TIC-80}-${version}/vendor/squirrel"

    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/wasm3" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/wasm3"
    cp -r wasm3-a3abb3f2d320994be59dfbe2cdafa8d0b6a8253e/ "${port/libretro-tic80/TIC-80}-${version}/vendor/wasm3"
    
    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/wren" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/wren"
    cp -r wren-4a18fc489f9ea3d253b20dd40f4cdad0d6bb40eb/ "${port/libretro-tic80/TIC-80}-${version}/vendor/wren"

    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/zip" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/zip"
    cp -r zip-d7df626f3aa457e01669f65e61bf8f484e352941/ "${port/libretro-tic80/TIC-80}-${version}/vendor/zip"

    [ -e "${port/libretro-tic80/TIC-80}-${version}/vendor/zlib" ] && rm -r "${port/libretro-tic80/TIC-80}-${version}/vendor/zlib"
    cp -r zlib-cacf7f1d4e3d44d871b605da3b647f07d718623f/ "${port/libretro-tic80/TIC-80}-${version}/vendor/zlib"

    run cmake "${configopts[@]}"
}

build() {
    run make "${makeopts[@]}"
}

install() {
    run mkdir -p ${SERENITY_INSTALL_ROOT}/usr/lib/libretro
    run cp lib/${port/libretro-/}_libretro.so ${SERENITY_INSTALL_ROOT}/usr/lib/libretro/
}
