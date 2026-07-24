# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=warzone2100
pkgver=4.7.0
pkgrel=1
pkgdesc="3D realtime strategy game on a future Earth"
url="https://wz2100.net/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-2.0-or-later')
depends=('sdl2' 'openal' 'libvorbis' 'libtheora' 'libsodium' 'physfs' 'sqlite' 'freetype2' 'libopus' 'fmt' 'zip' 'harfbuzz' 'fribidi')
makedepends=('libzip' 'mesa' 'vulkan-headers' 'shaderc' 'cmake' 'ninja' 'linux-headers' 'protobuf')
# 0001: Downstream, fix type mismatch warnings for bundled QuickJS
# 0003: Downstream, fix renamed Vulkan ColorSpaceKHR enum (eVkColorspaceSrgbNonlinear -> eSrgbNonlinear)
# 0004: Downstream, cast through intptr_t to drop const qualifier for IN6_IS_ADDR_V4MAPPED
source=(
  ${pkgname}-${pkgver}_src.tar.xz::https://github.com/Warzone2100/warzone2100/releases/download/${pkgver}/${pkgname}_src.tar.xz
  0001-no-cast-function-type-mismatch.patch
  0003-fix-vulkan-colorspace-enum-rename.patch
  0004-fix-in6-v4mapped-const-cast.patch
)
sha256sums=('95ee4d5b88680ea1b1cf230b67ea84028e08a2458b84605ac9f7fb9eb97c4e37'
            'a25200df8542dc0c432ef3dd1d74ed89ec0a54475b08b9db6dde0500d7361861'
            '464e87ab977bf1965faf6fc0af52c5ac6e34ae3b9505dbd52ece489d504f9f9f'
            '0e46ae129bc5e819089911c132e7a0e34ae6a1574f7e6fc25e02dd9568e05795')

prepare() {
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
