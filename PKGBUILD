# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libucontext
pkgver=1.3.3
pkgrel=1
pkgdesc="ucontext function implementations"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/kaniini/$pkgname"
license=('ISC')
source=("https://distfiles.dereferenced.org/$pkgname/$pkgname-${pkgver}.tar.xz")
sha512sums=('dbfe17bcd4efacf3cc688fbf96862a104b50fd66ab793644b1608f1abd65e56fab9cb005396e758cb4b9a3838981c6e68a6e04866d016dbb89e987d8e241e0c5')

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
