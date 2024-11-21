# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qt6-quick3d
_qtver=6.8.0
pkgver=${_qtver/-/}
pkgrel=2
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.qt.io'
license=(GPL3)
pkgdesc='Qt module and API for defining 3D content in Qt Quick'
depends=(qt6-base
         qt6-declarative
         qt6-quicktimeline
         qt6-shadertools
         zlib)
makedepends=(assimp
             cmake
             git
             ninja)
optdepends=('assimp: assimp import plugin')
groups=(qt6)
_pkgfn=${pkgname/6-/}-everywhere-src-$_qtver
source=(
  https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz
  fix-bezier-curve.patch
  fix-loongarch64.patch
)
sha256sums=('3e95044ee2da33db1a6fa3f834b09e71b2491c4899bac3a3bdf0c10b06f0223f'
            '15e8c0d30873abd3060eb02e9671861b56c43dfc9cc0432fd968e5f5ab109349'
            '5e9ee7be367a4cac9c882cef7f13331eaf25b2c21e269a07ce7720610892b36b')

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

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/$pkgname
}
