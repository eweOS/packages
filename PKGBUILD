# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=warzone2100
pkgver=4.5.5
pkgrel=1
pkgdesc="3D realtime strategy game on a future Earth"
url="https://wz2100.net/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL')
depends=('sdl2' 'openal' 'libvorbis' 'libtheora' 'libsodium' 'physfs' 'sqlite' 'freetype2' 'libopus' 'fmt' 'zip' 'harfbuzz' 'fribidi')
makedepends=('libzip' 'mesa' 'vulkan-headers' 'shaderc' 'cmake' 'ninja' 'linux-headers')
source=(
  ${pkgname}-${pkgver}_src.tar.xz::https://github.com/Warzone2100/warzone2100/releases/download/${pkgver}/${pkgname}_src.tar.xz
  no-cast-function-type-mismatch.patch
)
sha256sums=('07f61bae721687edeb62da4877e85030a03a053a593d645194fc65778e0480ff'
            'a25200df8542dc0c432ef3dd1d74ed89ec0a54475b08b9db6dde0500d7361861')

prepare() {
  # to drop const qualifier
  sed -i 's/IN6_IS_ADDR_V4MAPPED(/IN6_IS_ADDR_V4MAPPED((intptr_t)/' $pkgname/lib/netplay/netsocket.cpp
  _patch_ $pkgname
}

build() {
  # 3rdparty/quickjs-wz/quickjs.h:993:34: error: cast-function-type-mismatch
  CXXFLAGS+=" -Wno-cast-function-type-mismatch"
  cmake -B build -S ${pkgname} \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWZ_DISTRIBUTOR="eweOS" \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # why is this installed ? Just remove it !
  rm -rfv ${pkgdir}/usr/include
  rm -rfv ${pkgdir}/usr/lib
}
