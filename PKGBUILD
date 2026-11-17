# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtklock
pkgver=5.0.1
pkgrel=1
pkgdesc="GTK-based lockscreen for Wayland"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/jovanlanik/gtklock"
license=('GPL-3.0-only')
depends=(pam wayland gtk3 gtk-session-lock)
makedepends=(meson scdoc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b51bce5d81643dc3dcb422554d28e919f95d418ef54a082509763dfb6fdfb145')

prepare() {
  sed -i 's/login/system-local-login/' "$pkgname-$pkgver/pam/gtklock"
}

build() {
  ewe-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
