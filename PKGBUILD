# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sfwbar
pkgver=1.0_beta17
pkgrel=1
pkgdesc='S* Floating Window taskBar'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/LBCrion/sfwbar'
license=('GPL-3.0-or-later')
depends=(
  'wayland'
  'gtk3'
  'json-c'
  'gtk-layer-shell'
  'wayland-protocols'
)
optdepends=(
  'alsa-lib: ALSA audio volume control',
  'libpulse: pulse audio volume control',
  'libmpdclient: music player daemon control',
  'libxkbcommon: xkb layout conversion support'
)
makedepends=('meson' 'libpulse' 'libmpdclient' 'alsa-lib' 'python-docutils'
             'linux-headers' 'libpipewire')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a4915bc7dd0873c45d0d6b01b070e39a91fd16cfadf730d6a9e48db68a8cd09e')

build() {
    ewe-meson $pkgname-$pkgver build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
