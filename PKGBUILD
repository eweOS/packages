# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Mateusz 'mrlemux' Lemusisk mrlemux at gmail dotcom
# Based on the pcre package by Sébastien "Seblu" Luttringer
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=pcre2
pkgver=10.40
pkgrel=1
pkgdesc='A library that implements Perl 5-style regular expressions. 2nd version'
arch=('x86_64')
url='https://www.pcre.org/'
license=('BSD')
depends=('readline' 'zlib' 'bash')
source=("https://github.com/PhilipHazel/pcre2/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2"
	"grep_test.patch")
sha512sums=('SKIP' 'SKIP')

prepare() {
  cd $pkgname-$pkgver
  # no longer needed for 10.41!
  patch -f -p1 <$srcdir/grep_test.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    CFLAGS="$CFLAGS -O3" \
    --prefix=/usr \
    --enable-pcre2-16 \
    --enable-pcre2-32 \
    --enable-jit \
    --enable-pcre2grep-libz \
    --enable-pcre2test-libreadline
  make
}

check() {
  cd $pkgname-$pkgver
  make -j1 check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

