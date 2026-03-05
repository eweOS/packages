# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=jansson
pkgver=2.15.0
pkgrel=1
pkgdesc='C library for encoding, decoding and manipulating JSON data'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.digip.org/jansson/'
depends=('musl')
license=('MIT')
options=('staticlibs')
source=("https://github.com/akheron/jansson/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('070a629590723228dc3b744ae90e965a569efb9c535b3309b52e80e75d8eb3be')

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
