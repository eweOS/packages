# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Emmanuel 'guinness' Boudreault
# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=libunistring
pkgver=1.1
pkgrel=1
pkgdesc='Library for manipulating Unicode strings and C strings'
url='https://www.gnu.org/software/libunistring/'
arch=(x86_64 aarch64 riscv64)
license=(GPL)
depends=(musl)
provides=('libunistring.so')
source=(https://ftp.gnu.org/gnu/$pkgname/${pkgname}-${pkgver}.tar.xz)
sha512sums=('01a4267bbd301ea5c389b17ee918ae5b7d645da8b2c6c6f0f004ff2dead9f8e50cda2c6047358890a5fceadc8820ffc5154879193b9bb8970f3fb1fea1f411d6')

prepare()
{
  cd $pkgname-$pkgver
  sed -i '/pragma weak pthread_create/d' tests/glthread/thread.h
}

build()
{
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check()
{
  make -C $pkgname-$pkgver check
}

package()
{
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
