# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qt6-base
_qtver=6.8.0
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
pkgdesc='A cross-platform application and UI framework'
_pkgfn=${pkgname/6-/}-everywhere-src-$_qtver
depends=(libjpeg fontconfig vulkan-headers
         shared-mime-info sqlite mesa icu openssl
         libinput libxkbcommon dbus harfbuzz wayland
         libproxy)
makedepends=(cmake ninja linux-headers wayland-protocols gtk3)
optdepends=('freetds: MS SQL driver'
            'gdk-pixbuf2: GTK platform plugin'
            'gtk3: GTK platform plugin'
            'libfbclient: Firebird/iBase driver'
            'mariadb-libs: MariaDB driver'
            'pango: GTK platform plugin'
            'perl: for syncqt'
            'postgresql-libs: PostgreSQL driver'
            'qt6-wayland: to run Qt6 applications in a Wayland session'
            'unixodbc: ODBC driver')
source=(https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz
        qt6-base-cflags.patch
        qt6-base-nostrip.patch
        0001-QThread-Unix-refactor-to-split-QThreadPrivate-finish.patch)
sha256sums=('1bad481710aa27f872de6c9f72651f89a6107f0077003d0ebfcc9fd15cba3c75'
            '5411edbe215c24b30448fac69bd0ba7c882f545e8cf05027b2b6e2227abc5e78'
            '4b93f6a79039e676a56f9d6990a324a64a36f143916065973ded89adc621e094'
            '352cab05d413c0d2f0065923851ffd962822ca454ec70e19bc071857d3abfdf7')

prepare() {
  _patch_ $_pkgfn
  # qt6-base-cflags.patch: Use system CFLAGS
  # qt6-base-nostrip.patch: Don't strip binaries with qmake
  # 0001-QThread-Unix-refactor-to-split-QThreadPrivate-finish.patch: 
  #   https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/75516

}

build() {
  export CMARGS=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
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

  if check_option lto y; then
    CMARGS+=(-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON)
  else
    FEATUREARGS+=(-DFEATURE_ltcg=OFF)
  fi

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
