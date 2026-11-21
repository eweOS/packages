# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=qt6-graphs
pkgname=(qt6-graphs qt6-graphs-devel)
_qtver=6.12.0
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.qt.io'
license=('GPL-3.0-only WITH Qt-GPL-exception-1.0'
         'LGPL-3.0-only'
         'LicenseRef-Qt-Commercial')
pkgdesc='Qt module for data visualization with 2D and 3D graphs'
depends=(qt6-base
         qt6-declarative
         qt6-quick3d)
makedepends=(cmake
             git
             ninja
             qt6-base-devel
             qt6-declarative-devel
             qt6-quick3d-devel)
groups=(qt6)
_pkgfn=${pkgbase/6-/}-everywhere-src-$_qtver
source=(
  https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz
)
sha256sums=('18c4e968785447051d94b01f8e3c975e31ddc46065c0777443cecc50753a4d8c')

build() {
  export CMARGS=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS
  )

  check_option lto y && CMARGS+=(-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON)

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

  export FEATUREARGS=(
    -DFEATURE_graphs_2d=ON
    -DFEATURE_graphs_3d=ON
  )

  cmake -B build -S $_pkgfn -G Ninja \
    "${CMARGS[@]}" \
    "${DIRARGS[@]}" \
    "${FEATUREARGS[@]}"
  cmake --build build

  DESTDIR="$srcdir/install" cmake --install build

  cd $srcdir/install
  _pick_ devel usr/include/qt6/*/6.*
}

package_qt6-graphs() {
  cp -r $srcdir/install/* $pkgdir/

  install -Dm644 "$_pkgfn"/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_qt6-graphs-devel() {
  pkgdesc+=" (Private headers)"
  depends+=(qt6-graphs qt6-base-devel qt6-declarative-devel qt6-quick3d-devel)

  cp -r $srcdir/pkgs/devel/* $pkgdir/

  install -Dm644 "$_pkgfn"/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname"
}
