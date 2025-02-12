 # Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fluidsynth
pkgver=2.4.3
pkgrel=1
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
sha512sums=('847d2f4529ac1bad735b71b57067c50586df7e2526c6311925c209c0635ee1e1dca1bd77dc6006181fc19a616738c8de1242bfb209707c8dbea9d7e2acc61017')

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
