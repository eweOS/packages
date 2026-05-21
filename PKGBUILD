 # Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fluidsynth
pkgver=2.5.3
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
sha512sums=('704d14f16a2d9adfc19700fd79dc96c76557876b15abc3afa7d2b9545e2e19810ee797b8614851b81243e3fc8d0871b4053080321a0fa292141a7a522431eeeb')

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
