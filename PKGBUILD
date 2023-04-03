# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libcap
pkgver=2.66
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities"
arch=(x86_64 aarch64)
url="https://sites.google.com/site/fullycapable/"
license=(GPL2)
makedepends=(linux-headers)
source=(https://kernel.org/pub/linux/libs/security/linux-privs/${pkgname}2/$pkgname-$pkgver.tar.xz)
sha256sums=('15c40ededb3003d70a283fe587a36b7d19c8b3b554e33f86129c059a4bb466b2')

build()
{
  make \
    HOSTCC=clang CC=clang \
    DYNAMIC=yes KERNEL_HEADERS=/usr/include \
    lib=lib prefix=/usr sbindir=bin \
    -C $pkgname-$pkgver
}

package()
{
  make HOSTCC=clang CC=clang \
    DESTDIR="$pkgdir" \
    RAISE_SETFCAP=no \
    lib=lib prefix=/usr sbindir=bin \
    install -C $pkgname-$pkgver
}
