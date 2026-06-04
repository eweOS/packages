# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=qt6-location
pkgname=(qt6-location qt6-location-devel)
_qtver=6.11.1
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
pkgdesc='Helps you create viable mapping solutions using the data available from some of the popular location services'
depends=(qt6-base
         qt6-declarative
         qt6-positioning)
makedepends=(cmake
             git
             ninja
             qt6-base-devel
             qt6-declarative-devel
             qt6-positioning-devel)
groups=(qt6)
_pkgfn=${pkgbase/6-/}-everywhere-src-$_qtver
source=(
  https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz
)
sha256sums=('3791ce77299e6f600a593d0fbfa5bd32fbcfc2d16104782b84acc489e382e41b')

build() {
  export CMARGS=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON
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

  DESTDIR="$srcdir/install" cmake --install build

  cd $srcdir/install
  _pick_ devel usr/include/qt6/*/6.*
}

package_qt6-location() {
  cp -r $srcdir/install/* $pkgdir/

  install -Dm644 $_pkgfn/LICENSES/* -t "$srcdir/install"/usr/share/licenses/$pkgname
}

package_qt6-location-devel() {
  pkgdesc+=" (Private headers)"
  depends+=(qt6-location qt6-base-devel qt6-positioning-devel)

  cp -r $srcdir/pkgs/devel/* $pkgdir/

  install -Dm644 $_pkgfn/LICENSES/* -t "$srcdir/install"/usr/share/licenses/$pkgname
}
