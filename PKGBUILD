# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qt6-base
_qtver=6.7.0
pkgver=${_qtver/-/}
pkgrel=2
arch=(x86_64 aarch64 riscv64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework'
_pkgfn=${pkgname/6-/}-everywhere-src-$_qtver
depends=(libjpeg fontconfig vulkan-headers
         shared-mime-info sqlite mesa icu
         libinput libxkbcommon dbus harfbuzz wayland)
makedepends=(cmake ninja wayland-protocols)
source=(https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz
        qt6-base-cflags.patch
        qt6-base-nostrip.patch)
sha256sums=('11b2e29e2e52fb0e3b453ea13bbe51a10fdff36e1c192d8868c5a40233b8b254'
            '5411edbe215c24b30448fac69bd0ba7c882f545e8cf05027b2b6e2227abc5e78'
            '4b93f6a79039e676a56f9d6990a324a64a36f143916065973ded89adc621e094')

prepare() {
  patch -d $_pkgfn -p1 < qt6-base-cflags.patch # Use system CFLAGS
  patch -d $_pkgfn -p1 < qt6-base-nostrip.patch # Don't strip binaries with qmake
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

  export FEATUREARGS=(
    -DFEATURE_openssl_linked=ON
    -DFEATURE_system_sqlite=ON
    -DFEATURE_dbus_linked=ON
    -DFEATURE_system_freetype=ON
    -DFEATURE_system_harfbuzz=ON
    -DFEATURE_system_jpeg=ON
    -DFEATURE_system_png=ON
    -DFEATURE_opengles2=ON
    -DFEATURE_opengles3=ON
    -DFEATURE_opengles31=ON
    -DFEATURE_opengles32=ON
    -DFEATURE_opengl_desktop=OFF
  )

  cmake -B build -S $_pkgfn -G Ninja \
    "${CMARGS[@]}" \
    "${DIRARGS[@]}" \
    "${FEATUREARGS[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $_pkgfn/LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgbase

# Install symlinks for user-facing tools
  cd "$pkgdir"
  mkdir usr/bin
  while read _line; do
    ln -s $_line
  done < "$srcdir"/build/user_facing_tool_links.txt
}
