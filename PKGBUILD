# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=ninja
pkgver=1.11.1
pkgrel=1
pkgdesc='a small build system with a focus on speed'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/ninja-build/ninja'
license=(Apache)
depends=(python llvm-libs)
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=('31747ae633213f1eda3842686f83c2aa1412e0f5691d1c14dbbcc67fe7400cea')

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
