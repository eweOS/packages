# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtklock
pkgver=5.0.0
pkgrel=1
pkgdesc="GTK-based lockscreen for Wayland"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/jovanlanik/gtklock"
license=('GPL3')
depends=(pam wayland gtk3 gtk-session-lock)
makedepends=(meson scdoc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"add-feature-test-macro.patch")
sha256sums=('018c50cf1d7b626f823e797750e5b304511b3b359e7277e8abb3383c11e7aed9'
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
