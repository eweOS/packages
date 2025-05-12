# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=btop
pkgver=1.4.3
pkgrel=1
pkgdesc='A monitor of system resources, bpytop ported to C++'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/aristocratos/$pkgname"
license=(Apache)
depends=(musl llvm-libs)
makedepends=(linux-headers)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('81b133e59699a7fd89c5c54806e16452232f6452be9c14b3a634122e3ebed592')

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
