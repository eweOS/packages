# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libucontext
pkgver=1.3.2
pkgrel=2
pkgdesc="ucontext function implementations"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/kaniini/$pkgname"
license=('ISC')
source=("https://distfiles.dereferenced.org/$pkgname/$pkgname-${pkgver}.tar.xz")
sha512sums=('3911a9a772832dad68dc4dbb78ca646cba92170d4e192948e0a6e78295f6ee27f20b637986d39450edae805c96b08f7e1716fa7904fc84258acab8691d87c4f5')

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
