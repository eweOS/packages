# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=supertux
pkgver=0.6.3
pkgrel=11
pkgdesc="A classic 2D jump'n'run sidescroller game in a style similar to the original SuperMario games"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/supertux/supertux"
license=('GPL')
depends=('sdl2-image' 'curl' 'openal' 'libvorbis' 'physfs' 'freetype2'
         'boost-libs' 'hicolor-icon-theme')
makedepends=('cmake' 'boost' 'mesa' 'optipng' 'glm')
# 0001: Downstream, fix building with Clang 19
# 0002: Downstream, remove lookup for system component of boost to fix build
#	with boost 1.90.0
source=(
  "https://github.com/SuperTux/supertux/releases/download/v${pkgver}/SuperTux-v${pkgver}-Source.tar.gz"
  0001-fix-clang19.patch
  0002-Remove-Boost-system-component.patch
)
sha512sums=('c6540bab1b3befbd975756031c4587e5569d9613d9539dc829c728b574d1a4da92816d6a7e68947b32963cc13d9b8b52312701c199138640e9f89e5885433798'
            'fc0f67d461407041bca2cc6d044b50f997f1d9df1ed7f3bda1e3eca65fca2a220ce2330240fb50a9983cb42c3750061b7eb5235b2bf5be3a18c2998c22094f51'
            '39ccbda3763b107668ed075ceae06885684f14d527bb52c3f325fac6da44e5ea4c2c4dc0d9f544cdeed3541cc96c2a46e7c79f78bb32050725c9e4490a009325')

prepare() {
  _patch_ "SuperTux-v${pkgver}-Source"
}

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
