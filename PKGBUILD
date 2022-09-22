# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sway
pkgver=1.7
pkgrel=1
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager'
arch=(x86_64)
url='https://swaywm.org/'
license=(MIT)
depends=(
)
makedepends=(meson ninja wayland-protocols pcre2)
source=(
	"https://github.com/swaywm/sway/releases/download/$pkgver/sway-$pkgver.tar.gz"
	"pcre2.patch"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p1 < ../pcre2.patch
}

build() {
  mkdir -p build
  ewe-meson build "$pkgname-$pkgver" -D werror=false -D b_ndebug=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

