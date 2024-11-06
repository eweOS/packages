# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=composefs
pkgver=1.0.7
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
sha256sums=('ecab22e4bc00e1a3260765db8df45d2b68f796f8a265c4386be31cd308d17a75')

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
