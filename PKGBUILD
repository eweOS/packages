# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libffi
pkgname=(libffi libffi-static)
pkgver=3.7.1
pkgrel=1
pkgdesc='A portable Foregin Function Interface library.'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='http://sourceware.org/libffi/'
license=(MIT)
depends=(musl)
makedepends=(linux-headers)
checkdepends=(dejagnu)
provides=(libffi.so)
# 0001: Downstream, origin:
# https://github.com/chimera-linux/cports/blob/fcd94a077374eb0ff4cf7096813cc2ff8319ce2e/main/libffi8/patches/riscv-fix-clang.patch
source=("https://github.com/libffi/libffi/releases/download/v$pkgver/libffi-$pkgver.tar.gz"
	"0001-fix-float-atom-marshalling-on-clang.patch")

sha256sums=('d5e9a6638ddbd2513ddb54518eb67e4bbe6fa707bcc01c10f6212f0a088d819d'
            '7b4abcde4d75109a1066fa35bf4c8d761f6bf1b4c150d0d7264c5ee48e63d0d5')

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
