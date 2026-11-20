# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mobile-broadband-provider-info
pkgver=20261111
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
sha256sums=('8480fa709c9c8b98f542f1f1bd8bebbe56ddd07c9e2477cf2bcc88136d7299c6')

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
