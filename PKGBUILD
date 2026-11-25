# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libffi
pkgname=(libffi libffi-static)
pkgver=3.8.1
pkgrel=1
pkgdesc='A portable Foregin Function Interface library.'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='http://sourceware.org/libffi/'
license=(MIT)
depends=(musl)
makedepends=(linux-headers)
checkdepends=(dejagnu)
provides=(libffi.so)
source=("https://github.com/libffi/libffi/releases/download/v$pkgver/libffi-$pkgver.tar.gz")

sha256sums=('81e879c094cc5ec3186c48510c6385ac6b3e866192e8bc71a35245703757ee40')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

build() {
  local configure_options=(
    # remove --disable-exec-static-tramp once ghc and gobject-introspection
    # work fine with it enabled (https://github.com/libffi/libffi/pull/647)
    --disable-exec-static-tramp
    --disable-multi-os-directory
    --enable-shared
    --enable-symvers=no
    --prefix=/usr
  )

  cd "$pkgname-$pkgver"
  ./configure "${configure_options[@]}"
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package_libffi() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"
  _pick_ libffi-static usr/lib/*.a
}

package_libffi-static() {
  depends=(libffi="$pkgver-$pkgrel")
  options=(staticlibs !strip)
  mv "$srcdir"/pkgs/libffi-static/* "$pkgdir"
}
