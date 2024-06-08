# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=warzone2100
pkgver=4.4.2
pkgrel=1
pkgdesc="3D realtime strategy game on a future Earth"
url="https://wz2100.net/"
arch=(x86_64 aarch64 riscv64)
license=('GPL')
depends=('sdl2' 'openal' 'libvorbis' 'libtheora' 'libsodium' 'physfs' 'sqlite' 'freetype2' 'libopus' 'fmt' 'zip' 'harfbuzz' 'fribidi')
makedepends=('libzip' 'mesa' 'vulkan-headers' 'shaderc' 'cmake' 'ninja' 'linux-headers')
source=(${pkgname}-${pkgver}_src.tar.xz::https://github.com/Warzone2100/warzone2100/releases/download/${pkgver}/${pkgname}_src.tar.xz)
sha256sums=('3b962ac6aa75bca62bf2ebc067549db08fe4a1c3b38342910a2ac2aaabcbacde')

prepare() {
  # to drop const qualifier
  sed -i 's/IN6_IS_ADDR_V4MAPPED(/IN6_IS_ADDR_V4MAPPED((intptr_t)/' $pkgname/lib/netplay/netsocket.cpp
}

build() {
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
