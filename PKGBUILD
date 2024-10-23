# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libffi
pkgname=(libffi libffi-static)
pkgver=3.4.6
pkgrel=2
pkgdesc='A portable Foregin Function Interface library.'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='http://sourceware.org/libffi/'
license=(MIT)
depends=(musl)
makedepends=(linux-headers)
provides=(libffi.so)
source=("https://github.com/libffi/libffi/releases/download/v3.4.6/libffi-3.4.6.tar.gz")
sha256sums=('b0dea9df23c863a7a50e825440f3ebffabd65df1497108e5d437747843895a4e')

build() {
  local configure_options=(
    # remove --disable-exec-static-tramp once ghc and gobject-introspection
    # work fine with it enabled (https://github.com/libffi/libffi/pull/647)
    --disable-exec-static-tramp
    --disable-multi-os-directory
    --enable-shared
    --prefix=/usr
  )

  cd "$pkgname-$pkgver"
  ./configure "${configure_options[@]}"
  make
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
