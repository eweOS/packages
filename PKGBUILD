# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=ninja
pkgver=1.13.2
pkgrel=2
pkgdesc='a small build system with a focus on speed'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/ninja-build/ninja'
license=(Apache-2.0)
depends=(musl llvm-libs)
makedepends=(python)
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=('974d6b2f4eeefa25625d34da3cb36bdcebe7fbce40f4c16ac0835fd1c0cbae17')

build()
{
  cd $pkgname-$pkgver
  ./configure.py --bootstrap
}

package()
{
  cd $pkgname-$pkgver
  install -Dm 0755 ninja "${pkgdir}/usr/bin/ninja"
  _install_license_ COPYING
}
