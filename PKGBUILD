# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=composefs
pkgver=1.0.8
pkgrel=1
pkgdesc="A file system for mounting container images"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/containers/composefs"
license=(
  LGPL-2.1-or-later
  'BSD-2-Clause OR GPL-2.0-or-later'
  'GPL-2.0-only OR Apache-2.0'
  GPL-3.0-or-later
)
depends=(musl openssl)
# missing: go-md2man for docs
makedepends=(fuse3 linux-headers meson ninja)
checkdepends=(python)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2b2b11f9a25744c82e9e12b098eefd0ab42d56ae6322634c15f966b3a64926ef')

build() {
  ewe-meson "$pkgname-$pkgver" build \
    -Dfuse=enabled \
    -Dman=disabled
  meson compile -C build
}

check() {
  # self-depend to check
  # PATH="$srcdir/$pkgname-$pkgver/tools:$PATH"
  meson test -t 5 -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
  _install_license_ "$pkgname-$pkgver"/BSD-2-Clause.txt
}
