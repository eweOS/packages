# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libcap
pkgver=2.75
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://sites.google.com/site/fullycapable/"
license=(GPL-2.0-only)
makedepends=(linux-headers)
source=(https://kernel.org/pub/linux/libs/security/linux-privs/${pkgname}2/$pkgname-$pkgver.tar.xz)
sha256sums=('de4e7e064c9ba451d5234dd46e897d7c71c96a9ebf9a0c445bc04f4742d83632')

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
