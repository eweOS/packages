# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libucontext
pkgver=1.5.2
pkgrel=1
pkgdesc="ucontext function implementations"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/kaniini/$pkgname"
license=('ISC')
source=("https://distfiles.dereferenced.org/$pkgname/$pkgname-${pkgver}.tar.xz")
sha512sums=('6ff99fd3575d622f6b2202af98fd66f9132a0ac9fc65d4b182f858ee98ded1b852356fd60a44c43e32c1f5d68029ade7f12e6bf79ae174112ce1f39cd0108799')

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
  _install_license_ LICENSE
}
