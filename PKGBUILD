# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Mateusz 'mrlemux' Lemusisk mrlemux at gmail dotcom
# Based on the pcre package by Sébastien "Seblu" Luttringer
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=pcre2
pkgver=10.44
pkgrel=1
pkgdesc='A library that implements Perl 5-style regular expressions. 2nd version'
arch=(x86_64 aarch64 riscv64)
url='https://www.pcre.org/'
license=('BSD')
depends=('readline' 'zlib' 'bash')
source=("https://github.com/PhilipHazel/pcre2/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2")
sha512sums=('ee91cc10a2962bc7818b03d368df3dd31f42ea9a7260ae51483ea8cd331b7431e36e63256b0adc213cc6d6741e7c90414fd420622308c0ae3fcb5dd878591be2')

build()
{
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

check()
{
  cd $pkgname-$pkgver
  make -j1 check
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
