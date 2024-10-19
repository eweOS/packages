# Maintainer: Yukari Chiba <i@0x7f.cc>

_comp=serialport
pkgname=qt6-$_comp
_qtver=6.7.2
pkgver=${_qtver/-/}
pkgrel=2
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Provides access to hardware and virtual serial ports'
depends=(qt6-base)
makedepends=(cmake
             git
	     linux-headers
             ninja)
groups=(qt6)
_pkgfn=${pkgname/6-/}-everywhere-src-$_qtver
source=(https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz)
sha256sums=('21c34cd1161cb5197bcec662d26a17647b59b6fdff5c364576883c42dbd3b4fc')

build() {
  export CMARGS=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS
  )

  export DIRARGS=(
    -DINSTALL_BINDIR=lib/qt6/bin
    -DINSTALL_PUBLICBINDIR=usr/bin
    -DINSTALL_LIBEXECDIR=lib/qt6
    -DINSTALL_DOCDIR=share/doc/qt6
    -DINSTALL_ARCHDATADIR=lib/qt6
    -DINSTALL_DATADIR=share/qt6
    -DINSTALL_INCLUDEDIR=include/qt6
    -DINSTALL_MKSPECSDIR=lib/qt6/mkspecs
    -DINSTALL_EXAMPLESDIR=share/doc/qt6/examples
  )

  cmake -B build -S $_pkgfn -G Ninja \
    "${CMARGS[@]}" \
    "${DIRARGS[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/$pkgname
}
