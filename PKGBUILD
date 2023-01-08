# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkgbase=elfutils
pkgname=libelf
pkgver=0.188
pkgrel=1
pkgdesc="libelf is a free ELF object file access library"
arch=(x86_64 aarch64)
url="https://sourceware.org/elfutils/"
license=(LGPL3 GPL3)
makedepends=(curl llvm-libs libarchive sqlite xz zlib libuargp musl-fts musl-obstack)
options=(debug staticlibs)
source=(https://sourceware.org/$_pkgbase/ftp/$pkgver/$_pkgbase-$pkgver.tar.bz2 musl-utils.patch)
sha256sums=('SKIP' 'SKIP')

prepare()
{
  cd $_pkgbase-$pkgver
  patch -p1 < ${srcdir}/musl-utils.patch
}

build()
{
  cd $_pkgbase-$pkgver
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --program-prefix="eu-" \
    --enable-deterministic-archives \
    --disable-debuginfod
  make CFLAGS=-Wno-error
}

package()
{
  depends=(llvm-libs xz zlib)
  cd $_pkgbase-$pkgver
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/etc
  rm -r "$pkgdir"/usr/bin
  rm -r "$pkgdir"/usr/share
}
