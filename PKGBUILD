# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=qt6-base
pkgname=(qt6-base qt6-base-devel)
_qtver=6.11.1
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
pkgdesc='A cross-platform application and UI framework'
_pkgfn=${pkgbase/6-/}-everywhere-src-$_qtver
depends=(libjpeg fontconfig vulkan-headers
         shared-mime-info sqlite mesa icu openssl
         libinput libxkbcommon dbus harfbuzz wayland
         libproxy libcups double-conversion libb2 libproxy md4c)
makedepends=(cmake cups ninja linux-headers wayland-protocols gtk3 vulkan-headers)
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
	qt6-base-nostrip.patch)
sha256sums=('d9594a31228aa23ad6b531719a29b45f0f3989fe6c136d45767ea179f233c1ac'
            '5411edbe215c24b30448fac69bd0ba7c882f545e8cf05027b2b6e2227abc5e78'
            '4b93f6a79039e676a56f9d6990a324a64a36f143916065973ded89adc621e094')

prepare() {
  _patch_ $_pkgfn
  # qt6-base-cflags.patch: Use system CFLAGS
  # qt6-base-nostrip.patch: Don't strip binaries with qmake
}

build() {
  # fix for layer-shell-qt: https://bugs.gentoo.org/923292
  CXXFLAGS+=" -D_LIBCPP_TYPEINFO_COMPARISON_IMPLEMENTATION=2"

  export CMARGS=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS
  )

  export DIRARGS=(
    -DINSTALL_BINDIR=lib/qt6/bin
    -DINSTALL_PUBLICBINDIR=bin
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
    -DFEATURE_libproxy=ON
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

  DESTDIR="$srcdir/install" cmake --install build

  cd $srcdir/install
  _pick_ devel usr/include/qt6/*/6.*
}

package_qt6-base() {
  cp -r $srcdir/install/* $pkgdir/

  install -Dm644 $_pkgfn/LICENSES/* -t "$srcdir/install"/usr/share/licenses/$pkgname
}

package_qt6-base-devel() {
  pkgdesc+=" (Private headers)"
  depends+=(qt6-base)

  cp -r $srcdir/pkgs/devel/* $pkgdir/

  install -Dm644 $_pkgfn/LICENSES/* -t "$srcdir/install"/usr/share/licenses/$pkgname
}
