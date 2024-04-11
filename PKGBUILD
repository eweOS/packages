# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=grim
pkgver=1.4.1
pkgrel=1
pkgdesc='Screenshot utility for Wayland'
arch=(x86_64 aarch64 riscv64)
url='https://git.sr.ht/~emersion/grim'
license=(MIT)
depends=(cairo libjpeg wayland)
makedepends=(git meson ninja pango scdoc wayland-protocols)
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  ewe-meson build $pkgname
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 $pkgname/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
