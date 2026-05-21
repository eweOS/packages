# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=btop
pkgver=1.4.6
pkgrel=2
pkgdesc='A monitor of system resources, bpytop ported to C++'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/aristocratos/$pkgname"
license=(Apache)
depends=(musl llvm-libs)
makedepends=(linux-headers)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4beb90172c6acaac08c1b4a5112fb616772e214a7ef992bcbd461453295a58be')

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
