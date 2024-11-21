 # Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fluidsynth
pkgver=2.4.0
pkgrel=2
pkgdesc="A real-time software synthesizer based on the SoundFont 2 specifications"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.fluidsynth.org/"
license=(LGPL-2.1-or-later)
groups=(pro-audio)
depends=(sdl2)
makedepends=(
  alsa-lib
  cmake
  dbus
  glib2
  pipewire
  libpulse
  libsndfile
  readline
)
provides=(
  libfluidsynth.so
  soundfont-synthesizer
)
backup=(etc/conf.d/$pkgname)
source=($pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz)
sha512sums=('57770597e26140011324cac14dd81aa1f5fc52ec0c256a4e16f629b81b8d477279ad714cc9d1e375d74aabb348e1436eafd06746cdf10fa29196468645bf7600')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D FLUID_DAEMON_ENV_FILE=/etc/conf.d/fluidsynth
    -D LIB_SUFFIX=""
    -S $pkgname-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  make check -k -C build
}

package() {
  depends+=(
    alsa-lib
    dbus
    glib2
    pipewire
    libpulse
    libsndfile
    readline
  )

  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 build/$pkgname.conf "$pkgdir/etc/conf.d/$pkgname"
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,{CONTRIBUTING,README}.md,THANKS,TODO} -t "$pkgdir/usr/share/doc/$pkgname/"
}
