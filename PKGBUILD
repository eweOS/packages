# Maintainer: Yukari Chiba <i@0x7f.cc>

_comp=5compat
pkgbase=qt6-$_comp
pkgname=(qt6-$_comp qt6-$_comp-devel)
_qtver=6.11.1
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Module that contains unsupported Qt 5 APIs'
_pkgfn=${pkgbase/6-/}-everywhere-src-$_qtver
depends=(qt6-base qt6-shadertools icu)
makedepends=(cmake git ninja qt6-declarative qt6-shadertools-devel qt6-base-devel qt6-declarative-devel)
optdepends=('qt6-declarative: for QtGraphicalEffects')
groups=(qt6)
source=(https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz)
sha256sums=('cfcb9fdaa051aad54b0e61b24ac5693b4887a86e07609f665fea67328a6f161b')

build() {
  export CMARGS=(
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS
    -DCMAKE_INSTALL_PREFIX=/usr
  )

  cmake -B build -S $_pkgfn -G Ninja \
    "${CMARGS[@]}"
  cmake --build build

  DESTDIR="$srcdir/install" cmake --install build

  cd $srcdir/install
  _pick_ devel usr/include/qt6/*/6.*
}

package_qt6-5compat() {
  cp -r $srcdir/install/* $pkgdir/

  install -Dm644 $_pkgfn/LICENSES/* -t "$srcdir/install"/usr/share/licenses/$pkgname
}

package_qt6-5compat-devel() {
  pkgdesc+=" (Private headers)"
  depends+=(qt6-5compat qt6-base-devel)

  cp -r $srcdir/pkgs/devel/* $pkgdir/

  install -Dm644 $_pkgfn/LICENSES/* -t "$srcdir/install"/usr/share/licenses/$pkgname
}
