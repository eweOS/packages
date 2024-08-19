# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libucontext
pkgver=1.3.1
pkgrel=1
pkgdesc="ucontext function implementations"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/kaniini/$pkgname"
license=('ISC')
source=("https://distfiles.dereferenced.org/$pkgname/$pkgname-${pkgver}.tar.xz")
sha512sums=('9b3c7fc04aedbbed6f35fc18037b75472f8fa44d3c89f261ef923f46874251a10f49894f7a549b0b47d3ffdee1b6678929bdda95822d8043d76b5a1f34e4dc8a')

build()
{
  cd ${pkgname}-${pkgver}
  make ARCH="${CARCH}"
}

check()
{
  cd ${pkgname}-${pkgver}
  make ARCH="${CARCH}" check
}

package()
{
  cd ${pkgname}-${pkgver}
  make ARCH="${CARCH}" DESTDIR=${pkgdir} install
}
