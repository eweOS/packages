# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Mateusz 'mrlemux' Lemusisk mrlemux at gmail dotcom
# Based on the pcre package by Sébastien "Seblu" Luttringer
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgbase=pcre2
pkgname=(pcre2 pcre2-static)
pkgver=10.47
pkgrel=2
pkgdesc='A library that implements Perl 5-style regular expressions. 2nd version'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.pcre.org/'
license=('BSD-3-Clause')
depends=('readline' 'zlib' 'bash')
source=("https://github.com/PhilipHazel/pcre2/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2")
sha512sums=('889a6fdc80f8a7285e4a75d189c183b4588df81bdf048302cf0830e11bbf9b9eeb387ba43dfd3aff8ffb3aa693291e8c535845c06e8ce92d1028cefa6b474804')

build() {
  cd "$pkgname-$pkgver"
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
  cd "$pkgname-$pkgver"
  make -j1 check
}

package_pcre2() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  _install_license_ LICENCE.md

  cd "$pkgdir"
  _pick_ pcre2-static usr/lib/*.a
}

package_pcre2-static()
{
  options=(!strip staticlibs)
  depends=(pcre2="$pkgver-$pkgrel")
  mv "$srcdir/pkgs/$pkgname"/* "$pkgdir"
}
