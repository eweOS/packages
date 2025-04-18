# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libical
pkgver=3.0.20
pkgrel=2
pkgdesc="Implementation of iCalendar protocols and data formats"
url="https://github.com/libical/libical"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=("MPL-2.0 OR LGPL-2.1-only")
depends=(
  glib2
  icu
  libxml2
)
makedepends=(
  cmake
  git
  gobject-introspection
  gtk-doc
  ninja
  vala
)
checkdepends=(python-gobject tzdata )
source=(
  "git+$url#tag=v$pkgver"
)
sha256sums=('225aa158fdf782f1c80c74b060f2e9ad8b30c27af0f4482c744bf0a5b2e753f4')

build() {
  local cmake_options=(
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_DISABLE_FIND_PACKAGE_BerkeleyDB=true
    -D CMAKE_INSTALL_LIBEXECDIR=lib
    -D CMAKE_INSTALL_PREFIX=/usr
    -D GOBJECT_INTROSPECTION=true
    -D ICAL_GLIB_VAPI=true
    -D SHARED_ONLY=true
  )
  export CC=cc
  cmake -S $pkgname -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure --stop-on-failure -j$(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
