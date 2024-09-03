# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pavucontrol
pkgver=6.1
pkgrel=1
pkgdesc="PulseAudio Volume Control"
url="https://freedesktop.org/software/pulseaudio/pavucontrol/"
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later)
depends=(
  glib2
  glibmm
  gtk4
  gtkmm
  json-glib
  libpulse
  libsigc++3
)
#TODO: libcanberra to depends
makedepends=(
  git
  meson
)
source=("git+https://gitlab.freedesktop.org/pulseaudio/pavucontrol.git#tag=v$pkgver")
sha256sums=('5d37e9a1e9d8f8d523d30a741c0f16fd024e85bd2f3d06adb3cae0c0d5bba2b6')

build() {
  ewe-meson pavucontrol build -D lynx=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
