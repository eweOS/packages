# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Mateusz 'mrlemux' Lemusisk mrlemux at gmail dotcom
# Based on the pcre package by Sébastien "Seblu" Luttringer
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgbase=pcre2
pkgname=(pcre2 pcre2-static)
pkgver=10.49
pkgrel=1
pkgdesc='A library that implements Perl 5-style regular expressions. 2nd version'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.pcre.org/'
license=('BSD-3-Clause')
depends=('readline' 'zlib' 'bash')
source=("https://github.com/PhilipHazel/pcre2/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2")
sha512sums=('eb8351788a479cb24bcc263243d6a00d28cc7285f26901d7f6001826aba7f7171a5bb3e7c944725432df6f303c10a794fd3a398429483bf4c1104df3de159687')

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
