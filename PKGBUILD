# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libucontext
pkgver=1.2
pkgrel=1
pkgdesc="ucontext function implementations"
arch=("x86_64" "aarch64")
url="https://github.com/kaniini/$pkgname"
license=('ISC')
source=("https://distfiles.dereferenced.org/$pkgname/$pkgname-${pkgver}.tar.xz")
sha512sums=('SKIP')

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
