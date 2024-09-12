# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qt6-tools
_qtver=6.7.2
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64 aarch64 riscv64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Classes for QML and JavaScript languages'
_pkgfn=${pkgname/6-/}-everywhere-src-$_qtver
depends=(qt6-base zstd)
makedepends=(cmake git ninja python qt6-declarative openmp)
groups=(qt6)
source=(https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz zstd-configure.patch)
sha256sums=('58e855ad1b2533094726c8a425766b63a04a0eede2ed85086860e54593aa4b2a'
            '1366f49682e19c344bdd94ab70c66b29879b0c0a2bc20826d1accd8da88f53d1')

prepare() {
  _patch_ $_pkgfn
}

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
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Install symlinks for user-facing tools
  cd "$pkgdir"
  mkdir usr/bin
  while read _line; do
    ln -s $_line
  done < "$srcdir"/build/user_facing_tool_links.txt

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/$pkgname
}
