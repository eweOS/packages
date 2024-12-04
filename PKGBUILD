# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtklock
pkgver=4.0.0
pkgrel=3
pkgdesc="GTK-based lockscreen for Wayland"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/jovanlanik/gtklock"
license=('GPL3')
depends=(pam wayland gtk3 gtk-session-lock)
makedepends=(meson scdoc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"add-feature-test-macro.patch")
sha256sums=('db20bf27bd5dd01901ea1753c89c170777dd7cf8fca19130cf90f5f4e3fb9633'
            '18e20daedb81acb3302e9822aab8ac3f820ab728db1b008cf2ae64ce8507fafb')

prepare() {
  _patch_ "$pkgname-$pkgver"
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
