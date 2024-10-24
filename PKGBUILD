# Maintainer: Yukari Chiba <i@0x7f.cc>
pkgname=gtklock
pkgver=4.0.0
pkgrel=1
pkgdesc="GTK-based lockscreen for Wayland"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/jovanlanik/gtklock"
license=('GPL3')
depends=(pam wayland gtk3 gtk-session-lock)
makedepends=(meson scdoc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('db20bf27bd5dd01901ea1753c89c170777dd7cf8fca19130cf90f5f4e3fb9633')

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
