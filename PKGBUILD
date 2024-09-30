# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qt6-wayland
_qtver=6.7.2
pkgver=${_qtver/-/}
pkgrel=2
arch=(x86_64 aarch64 riscv64)
url='https://www.qt.io'
license=(GPL-3.0-or-later LGPL-3.0-or-later FDL custom)
pkgdesc='An implementation of the Language Server Protocol'
_pkgfn=${pkgname/6-/}-everywhere-src-$_qtver
depends=(qt6-base qt6-declarative wayland)
makedepends=(cmake git ninja wayland-protocols)
groups=(qt6)
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz"
	"ensure-shell-surface.patch::https://invent.kde.org/qt/qt/qtwayland/-/commit/92bcb8f6b7a852c7a5d662fc34de561692a7a454.patch")
sha256sums=('a2a057e1dd644bd44abb9990fecc194b2e25c2e0f39e81aa9fee4c1e5e2a8a5b'
            '2faabf39e563c3b2c1719a05f2de582f70dd9bc028f630906206739dceae1ea2')

prepare() {
	_patch_ "$_pkgfn"
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
