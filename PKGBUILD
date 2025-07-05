# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=ninja
pkgver=1.13.0
pkgrel=1
pkgdesc='a small build system with a focus on speed'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/ninja-build/ninja'
license=(Apache)
depends=(python llvm-libs)
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=('f08641d00099a9e40d44ec0146f841c472ae58b7e6dd517bee3945cfd923cedf')

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
