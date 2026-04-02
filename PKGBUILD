# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=supertux
pkgver=0.7.0
pkgrel=1
pkgdesc="A classic 2D jump'n'run sidescroller game in a style similar to the original SuperMario games"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/supertux/supertux"
license=('GPL-3.0-only')
depends=('sdl2-image' 'curl' 'openal' 'libvorbis' 'physfs' 'freetype2'
         'boost-libs' 'hicolor-icon-theme')
makedepends=('cmake' 'boost' 'mesa' 'optipng' 'glm')
source=(
  "https://github.com/SuperTux/supertux/releases/download/v${pkgver}/SuperTux-v${pkgver}-Source.tar.gz"
)
sha512sums=('15bc4f84e1453be25ac3fa3496443e4e20d805f8c4d50148235f4dc82d188bef974fc720653cab36350d8b631c74539e4a74c33259fdaac6a516f44f8ed65297')

build() {
  cd "SuperTux-v${pkgver}-Source"

  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  cmake \
      -DENABLE_DISCORD=ON \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DINSTALL_SUBDIR_BIN=bin \
      -DCMAKE_BUILD_TYPE=Release \
      -DENABLE_OPENGLES2=ON
  make
}

package() {
  cd "SuperTux-v${pkgver}-Source"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include
}
