# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libucontext
pkgver=1.2
pkgrel=1
pkgdesc="ucontext function implementations"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/kaniini/$pkgname"
license=('ISC')
source=("https://distfiles.dereferenced.org/$pkgname/$pkgname-${pkgver}.tar.xz")
sha512sums=('6603f2dcd87c4d9919c1726f2964632483e1a647733ff543d5935e3e2dac548adf320f1f9fb4c494691fe99fb393d64b15369f04d3783b2ca4c40b68c3d87865')

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
  mv ${pkgdir}/lib/* ${pkgdir}/usr/lib/
  rm -r ${pkgdir}/lib
}
