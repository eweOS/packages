# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=btop
pkgver=1.4.8
pkgrel=1
pkgdesc='A monitor of system resources, bpytop ported to C++'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/aristocratos/$pkgname"
license=(Apache)
depends=(musl llvm-libs)
makedepends=(linux-headers)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('67e07c21b770a6d884c5e50ba1d2cfc90732ea57459367d8732ec7ecbeb3be5f')

build()
{
  make -C "$pkgname-$pkgver" OPTFLAGS= all
}

package()
{
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  _install_license_ LICENSE
}
