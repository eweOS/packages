# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libical
pkgver=3.0.18
pkgrel=1
pkgdesc="Implementation of iCalendar protocols and data formats"
url="https://github.com/libical/libical"
arch=(x86_64 aarch64 riscv64)
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
  0001-Fix-build-with-ICU-75.patch
  0002-HACK-Disable-failing-test.patch
)
sha256sums=('b869d0befba0518c7b16378804bbe77ba7db27a8aa0c4309bd8c8b222164933f'
            '711ec494bc41fe3081deb3fc23172e0d31b1023e3c65d49532918fae0bf59a3e'
            '3485aa9cadb0e93407641bf4db28c372cb8da989140981d8774ff31c097dbbea')

prepare() {
  cd $pkgname

  # ICU 75 compatibility
  # https://github.com/libical/libical/issues/684
  git apply -3 ../0001-Fix-build-with-ICU-75.patch
  git apply -3 ../0002-HACK-Disable-failing-test.patch
}

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
