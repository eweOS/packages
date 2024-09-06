# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sfwbar
pkgver=1.0_beta15
pkgrel=1
pkgdesc='S* Floating Window taskBar'
arch=('x86_64' 'aarch64' 'riscv64')
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
makedepends=('meson' 'libpulse' 'libmpdclient' 'alsa-lib' 'python-docutils' 'linux-headers')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e7b45b810659ddb4c1877c486e6c2e40830473ff2e562a9176b149eae1fa8b5f')

build() {
    ewe-meson $pkgname-$pkgver build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
