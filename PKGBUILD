# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mobile-broadband-provider-info
pkgver=20250613
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
sha256sums=('c0f6c541d7cf99aa6696fbe0125873d6a0f2887b7ed3a9c4ca260e21706116df')

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
