# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libical
pkgver=4.0.2
pkgrel=1
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
  gi-docgen
  doxygen
  gtk-doc
  ninja
  vala
)
checkdepends=(python-gobject tzdata )
source=(
  "git+$url#tag=v$pkgver"
)
sha256sums=('e919826e4df28e14a85ef8cc3eaeff53c7b49cc8f56947df04c4474660d9b1ec')

build() {
  local cmake_options=(
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_DISABLE_FIND_PACKAGE_BerkeleyDB=true
    -D CMAKE_INSTALL_LIBEXECDIR=lib
    -D CMAKE_INSTALL_PREFIX=/usr
    -D LIBICAL_JAVA_BINDINGS=false
    -D LIBICAL_GOBJECT_INTROSPECTION=true
    -D LIBICAL_GLIB_VAPI=true
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
