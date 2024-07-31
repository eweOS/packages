# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=ninja
pkgver=1.12.1
pkgrel=1
pkgdesc='a small build system with a focus on speed'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/ninja-build/ninja'
license=(Apache)
depends=(python llvm-libs)
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=('821bdff48a3f683bc4bb3b6f0b5fe7b2d647cf65d52aeb63328c91a6c6df285a')

build()
{
  cd $pkgname-$pkgver
  ./configure.py --bootstrap
}

package()
{
  cd $pkgname-$pkgver
  install -d "${pkgdir}/usr/bin"
  install -m 0755 ninja "${pkgdir}/usr/bin/"
}
