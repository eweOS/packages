# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libcap
pkgver=2.76
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://sites.google.com/site/fullycapable/"
license=(GPL-2.0-only)
makedepends=(linux-headers)
source=(https://kernel.org/pub/linux/libs/security/linux-privs/${pkgname}2/$pkgname-$pkgver.tar.xz)
sha256sums=('629da4ab29900d0f7fcc36227073743119925fd711c99a1689bbf5c9b40c8e6f')

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
