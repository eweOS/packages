# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=supertux
pkgver=0.7.0
pkgrel=1
pkgdesc="A classic 2D jump'n'run sidescroller game in a style similar to the original SuperMario games"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/supertux/supertux"
license=('GPL-3.0-only')
depends=('sdl2-image' 'curl' 'openal' 'libvorbis' 'glew' 'physfs' 'freetype2'
         'fmt' 'libogg' 'libpng' 'hicolor-icon-theme' 'glu')
makedepends=('cmake' 'mesa' 'optipng' 'glm')
# 0001: Downstream, fix for "execinfo.h not available"
# 0002: Downstream: fix opengl detection
source=(
  "https://github.com/SuperTux/supertux/releases/download/v${pkgver}/SuperTux-v${pkgver}-Source.tar.gz"
  0001-Fix-execinfo.h-not-available-on-musl.patch
  0002-Fix-OpenGL-detection.patch
)
sha512sums=('15bc4f84e1453be25ac3fa3496443e4e20d805f8c4d50148235f4dc82d188bef974fc720653cab36350d8b631c74539e4a74c33259fdaac6a516f44f8ed65297'
            '806a3b2b9ba148c4f1aeb7ccb6aa5be70ed79fba641a1b20caf3d6997915981ae57cb9f4e6e258b4465b0e87fa269c5f9ccbd68db9799571ca22e5a5c7ad8419'
            '92b5a223c52705a7853ef48445b5fadb28640e6e11c80f0b4c9e108bba5ef9c4b75a43c8942fd8c7bd0373e1f3fa998427fa8023934c65a95ba66f98b0a1943c')

prepare() {
  _patch_ "SuperTux-v${pkgver}-Source"
}

build() {
  cd "SuperTux-v${pkgver}-Source"

  cmake \
      -DENABLE_DISCORD=ON \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DINSTALL_SUBDIR_BIN=bin
  make
}

package() {
  cd "SuperTux-v${pkgver}-Source"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include
}
