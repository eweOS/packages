# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=qt6-wayland
pkgname=(qt6-wayland qt6-wayland-devel)
_qtver=6.11.1
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.qt.io'
license=(GPL-3.0-or-later LGPL-3.0-or-later FDL custom)
pkgdesc='An implementation of the Language Server Protocol'
_pkgfn=${pkgbase/6-/}-everywhere-src-$_qtver
depends=(qt6-base qt6-declarative qt6-svg wayland)
makedepends=(cmake git ninja wayland-protocols qt6-base-devel qt6-declarative-devel linux-headers)
groups=(qt6)
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz")
sha256sums=('95788aa502f75441d4edf65932b235f76523084e13dbbb7b9ee2d207b32bd9b3')

build() {
  export CMARGS=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS
    -DCMAKE_PREFIX_PATH=/usr/lib/cmake
  )

  export DIRARGS=(
    -DINSTALL_BINDIR=lib/qt6/bin
    -DINSTALL_PUBLICBINDIR=usr/bin
    -DINSTALL_SHAREDIR=share
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

package_qt6-wayland() {
  cp -r $srcdir/install/* $pkgdir/

  install -Dm644 $_pkgfn/LICENSES/* -t "$srcdir/install"/usr/share/licenses/$pkgname
}

package_qt6-wayland-devel() {
  pkgdesc+=" (Private headers)"
  depends+=(qt6-wayland qt6-base-devel qt6-declarative-devel)

  cp -r $srcdir/pkgs/devel/* $pkgdir/

  install -Dm644 $_pkgfn/LICENSES/* -t "$srcdir/install"/usr/share/licenses/$pkgname
}
