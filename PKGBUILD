# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mobile-broadband-provider-info
pkgver=20240407
pkgrel=1
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
sha256sums=('dbb631f9b5a26da09bdfc8840475a389986b8abd63b2ce073e8fd56c65d7aff9')

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
