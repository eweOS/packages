# Maintainer: Yukari Chiba <i@0x7f.cc>

_comp=5compat
pkgname=qt6-$_comp
_qtver=6.7.2
pkgver=${_qtver/-/}
pkgrel=1
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
sha256sums=('8826b5189efc4d9bdb64fdb1aa89d0fdf4e53c60948ed7995621ed046e38c003')

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
