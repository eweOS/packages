 # Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fluidsynth
pkgver=2.3.6
pkgrel=1
pkgdesc="A real-time software synthesizer based on the SoundFont 2 specifications"
arch=(x86_64 aarch64 riscv64)
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
sha512sums=('521e103e49c281ab7a44a2a275f614894062c1be6eb4df776b11e3756803c6b4b73d1e9596d364959c81b37dff4798d56798f9262c486e098f072ae1e7bef1c1')

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
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,ChangeLog,{CONTRIBUTING,README}.md,THANKS,TODO} -t "$pkgdir/usr/share/doc/$pkgname/"
}
