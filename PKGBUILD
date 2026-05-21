# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libucontext
pkgver=1.5
pkgrel=2
pkgdesc="ucontext function implementations"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/kaniini/$pkgname"
license=('ISC')
source=("https://distfiles.dereferenced.org/$pkgname/$pkgname-${pkgver}.tar.xz")
sha512sums=('b1a23894a5e395de012fed79e178cfb9a1e26548de4635ba50e873f17d7a0f977a799df287d214a31242857c811d434d0757a9fa2788a0a2adb8c706ca9d1a94')

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
