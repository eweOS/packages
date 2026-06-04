# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=qt6-shadertools
pkgname=(qt6-shadertools qt6-shadertools-devel)
_qtver=6.11.1
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Provides functionality for the shader pipeline that allows Qt Quick to operate on Vulkan, Metal, and Direct3D, in addition to OpenGL'
_pkgfn=${pkgbase/6-/}-everywhere-src-$_qtver
depends=(qt6-base)
makedepends=(cmake git ninja qt6-base-devel)
groups=(qt6)
source=(https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz)
sha256sums=('2075052f9b23bcf9de045bbd180037084942f82cce870aab14a1454902c982fc')

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

  cmake -B build -S $_pkgfn -G Ninja \
    "${CMARGS[@]}" \
    "${DIRARGS[@]}"
  cmake --build build
  
  DESTDIR="$srcdir/install" cmake --install build

  cd $srcdir/install
  _pick_ devel usr/include/qt6/*/6.*
}

package_qt6-shadertools() {
  cp -r $srcdir/install/* $pkgdir/

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/$pkgname
}

package_qt6-shadertools-devel() {
  pkgdesc+=" (Private headers)"
  depends+=(qt6-shadertools qt6-base-devel)

  cp -r $srcdir/pkgs/devel/* $pkgdir/

  install -Dm644 $_pkgfn/LICENSES/* -t "$srcdir/install"/usr/share/licenses/$pkgname
}
