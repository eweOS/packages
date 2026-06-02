# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=qt6-tools
pkgname=(qt6-tools qt6-tools-devel)
_qtver=6.10.0
pkgver=${_qtver/-/}
pkgrel=3
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Classes for QML and JavaScript languages'
_pkgfn=${pkgbase/6-/}-everywhere-src-$_qtver
depends=(qt6-base zstd)
makedepends=(cmake git ninja python qt6-base-devel qt6-declarative-devel llvm-devel)
groups=(qt6)
source=(https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz)
sha256sums=('d86d5098cf3e3e599f37e18df477e65908fc8f036e10ea731b3469ec4fdbd02a')

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

package_qt6-tools() {
  cp -r $srcdir/install/* $pkgdir/

  # Install symlinks for user-facing tools
  pushd "$pkgdir"
  mkdir usr/bin
  while read _line; do
    ln -s $_line
  done < "$srcdir"/build/user_facing_tool_links.txt
  popd

  install -Dm644 $_pkgfn/LICENSES/* -t "$srcdir/install"/usr/share/licenses/$pkgname
}

package_qt6-tools-devel() {
  pkgdesc+=" (Private headers)"
  depends+=(qt6-tools qt6-base-devel)

  cp -r $srcdir/pkgs/devel/* $pkgdir/

  install -Dm644 $_pkgfn/LICENSES/* -t "$srcdir/install"/usr/share/licenses/$pkgname
}
