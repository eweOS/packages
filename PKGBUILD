# Maintainer: Yukari Chiba <i@0x7f.cc>

_comp=5compat
pkgname=qt6-$_comp
_qtver=6.7.0
pkgver=${_qtver/-/}
pkgrel=2
arch=(x86_64 aarch64 riscv64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Module that contains unsupported Qt 5 APIs'
_pkgfn=${pkgname/6-/}-everywhere-src-$_qtver
depends=(qt6-base qt6-shadertools icu)
makedepends=(cmake git ninja qt6-declarative qt6-shadertools)
optdepends=('qt6-declarative: for QtGraphicalEffects')
groups=(qt6)
source=(https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz)
sha256sums=('9d49d4fd8345d8a40b63e0b65cd49c1d8286e33a7f1409bf1316763f654e19f5')

build() {
  export CMARGS=(
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS
    -DCMAKE_INSTALL_PREFIX=/usr
  )

  cmake -B build -S $_pkgfn -G Ninja \
    "${CMARGS[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/$pkgname
}
