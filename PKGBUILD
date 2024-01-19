# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libdisplay-info
pkgver=0.1.1
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
sha256sums=('0d8731588e9f82a9cac96324a3d7c82e2ba5b1b5e006143fefe692c74069fb60')

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

