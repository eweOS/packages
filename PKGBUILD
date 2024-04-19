# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=pulseaudio
pkgname=libpulse
pkgver=17.0
pkgrel=1
pkgdesc="A featureful, general-purpose sound server"
url="https://www.freedesktop.org/wiki/Software/PulseAudio/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
makedepends=(
  perl-xml-parser
  alsa-lib
  attr
  dbus
  git
  gtk3
  libcap
  libsndfile
  meson
  openssl
)
depends=(
  dbus
  libsndfile
)
source=("git+https://gitlab.freedesktop.org/pulseaudio/pulseaudio.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  local meson_options=(
    -D daemon=false
    -D pulsedsp-location='/usr/\$LIB/pulseaudio'
    -D stream-restore-clear-old-devices=true
    -D tcpwrap=disabled
    -D valgrind=disabled
    -D systemd=disabled
    -D x11=disabled
    -D fftw=disabled
    -D asyncns=disabled
    -D tests=false
    -D doxygen=false
    -D udevrulesdir=/usr/lib/udev/rules.d
  )
  ewe-meson $pkgbase build "${meson_options[@]}"
  meson compile -C build
}

package() {
  provides=(
    libpulse-mainloop-glib.so
    libpulse-simple.so
    libpulse.so
  )
  backup=(etc/pulse/client.conf)
  meson install -C build --destdir "$pkgdir"
}
