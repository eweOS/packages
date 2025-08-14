# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libdisplay-info
pkgver=0.3.0
pkgrel=1
pkgdesc='EDID and DisplayID library'
url="https://gitlab.freedesktop.org/emersion/$pkgname"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
makedepends=(
  hwdata
  meson
  ninja
  python
)
provides=(libdisplay-info.so)
source=("$url/-/releases/$pkgver/downloads/$pkgname-$pkgver.tar.xz")
sha256sums=('6ae77cd937f9cf7d1321d35c116062c4911e8447010a6a713ac4286f7a9d5987')

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

