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
sha256sums=('fb8b0e8d0802005b9a309c60c1d8de32dd2951b56f0c3a3cb56d21ce01595dff'
            'c92ade324270f3f34fe4978cd55dbfcdc867cf8421d23edc23c78414b5b1ebb3')

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
