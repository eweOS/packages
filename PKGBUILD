# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libucontext
pkgver=1.5.1
pkgrel=1
pkgdesc="ucontext function implementations"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/kaniini/$pkgname"
license=('ISC')
source=("https://distfiles.dereferenced.org/$pkgname/$pkgname-${pkgver}.tar.xz")
sha512sums=('3bd82845fb41adaeee4a57e24e816ba9c22e207a59da8591f9c84dbecc2a258f3ac5ec3361186ae552045dffd15495c56590799fa2fd6163fdd281b61614f8d8')

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
