# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=qt6-3d
pkgname=(qt6-3d qt6-3d-devel)
_qtver=6.11.1
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.qt.io'
license=(GPL3)
pkgdesc='C++ and QML APIs for easy inclusion of 3D graphics'
depends=(qt6-base)
makedepends=(assimp
             cmake
             git
             ninja
             qt6-base-devel
             qt6-declarative-devel
             qt6-shadertools-devel)
optdepends=('assimp: assimp importer plugin'
            'qt6-declarative: QML bindings'
            'qt6-shadertools: RHI renderer')
groups=(qt6)
_pkgfn=${pkgbase/6-/}-everywhere-src-$_qtver
source=(
  https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz
)
sha256sums=('a66d8c8e049d1ee7a7687b34940f3555d0d7084858b6dc78d1e1cb7df40a0107')

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

package_qt6-3d() {
  cp -r $srcdir/install/* $pkgdir/

  install -Dm644 $_pkgfn/LICENSES/* -t "$srcdir/install"/usr/share/licenses/$pkgname
}

package_qt6-3d-devel() {
  pkgdesc+=" (Private headers)"
  depends+=(qt6-3d qt6-base-devel qt6-declarative-devel)

  cp -r $srcdir/pkgs/devel/* $pkgdir/

  install -Dm644 $_pkgfn/LICENSES/* -t "$srcdir/install"/usr/share/licenses/$pkgname
}
