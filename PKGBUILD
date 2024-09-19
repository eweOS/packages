# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=composefs
pkgver=1.0.6
pkgrel=1
pkgdesc="A file system for mounting container images"
arch=(x86_64 aarch64 riscv64)
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"0001-fix-include-of-linux-limits.h.patch")
sha256sums=('d54b302d91a2bf3f2fd0538555aed31ee86b05613d41185f744bbb9218cde4be'
            'e318149c8cc7ab309971d985ae97b61c680332dcfefd0e59922011b24626507e')

prepare() {
  sed -i 's/c_std=c99/c_std=c11/g' "$pkgname-$pkgver"/meson.build
  _patch_ "$pkgname-$pkgver"
}

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
