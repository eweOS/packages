# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mobile-broadband-provider-info
pkgver=20251101
pkgrel=2
pkgdesc="APN configuration presets for mobile broadband connections"
url="https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info"
arch=(any)
license=(CC-PDDC)
makedepends=(
  git
  libxslt
  meson
)
source=("git+$url.git#tag=$pkgver")
sha256sums=('c7aba7be040985ee664acc6473e3a827f56d9d1394c0f7e2962b392d82b9242e')

build() {
  ewe-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
