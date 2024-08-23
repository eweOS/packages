# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=supertux
pkgver=0.6.3
pkgrel=2
pkgdesc="A classic 2D jump'n'run sidescroller game in a style similar to the original SuperMario games"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/supertux/supertux"
license=('GPL')
depends=('sdl2_image' 'curl' 'openal' 'libvorbis' 'physfs' 'freetype2' 'boost-libs' 'hicolor-icon-theme')
makedepends=('cmake' 'boost' 'mesa' 'optipng' 'glm')
source=("https://github.com/SuperTux/supertux/releases/download/v${pkgver}/SuperTux-v${pkgver}-Source.tar.gz")
sha512sums=('c6540bab1b3befbd975756031c4587e5569d9613d9539dc829c728b574d1a4da92816d6a7e68947b32963cc13d9b8b52312701c199138640e9f89e5885433798')

build() {
  cd "SuperTux-v${pkgver}-Source"

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
