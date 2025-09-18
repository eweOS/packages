# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pavucontrol
pkgver=6.2
pkgrel=1
pkgdesc="PulseAudio Volume Control"
url="https://freedesktop.org/software/pulseaudio/pavucontrol/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(
  glib2
  glibmm
  gtk4
  gtkmm
  json-glib
  libcanberra
  libpulse
  libsigc++3
)
makedepends=(
  git
  meson
)
source=("git+https://gitlab.freedesktop.org/pulseaudio/pavucontrol.git#tag=v$pkgver")
sha256sums=('1a6bdc2f4e8516b995e6919c0fa8c74ed247c0b5f6f60da8909728ca56518342')

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
