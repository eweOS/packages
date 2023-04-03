# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=jansson
pkgver=2.14
pkgrel=2
pkgdesc='C library for encoding, decoding and manipulating JSON data'
arch=(x86_64 aarch64)
url='https://www.digip.org/jansson/'
depends=('musl')
license=('MIT')
options=('staticlibs')
source=("https://github.com/akheron/jansson/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5798d010e41cf8d76b66236cfb2f2543c8d082181d16bc3085ab49538d4b9929')

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
