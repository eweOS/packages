# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libdisplay-info
pkgver=0.2.0
pkgrel=1
pkgdesc='EDID and DisplayID library'
url="https://gitlab.freedesktop.org/emersion/$pkgname"
arch=(x86_64 aarch64 riscv64)
license=(MIT)
makedepends=(
  hwdata
  meson
  ninja
  python
)
provides=(libdisplay-info.so)
source=("$url/-/releases/$pkgver/downloads/$pkgname-$pkgver.tar.xz")
sha256sums=('5a2f002a16f42dd3540c8846f80a90b8f4bdcd067a94b9d2087bc2feae974176')

build() {
  ewe-meson $pkgname-$pkgver build
  ninja -C build
}

check() {
  # # Enable checks in next release when edid-decode is not required for tests:
  # https://gitlab.freedesktop.org/emersion/libdisplay-info/-/issues/35
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
 DESTDIR="$pkgdir" ninja -C build install
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$pkgname-$pkgver/LICENSE"
}

