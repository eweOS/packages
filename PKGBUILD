# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=btop
pkgver=1.4.7
pkgrel=1
pkgdesc='A monitor of system resources, bpytop ported to C++'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/aristocratos/$pkgname"
license=(Apache)
depends=(musl llvm-libs)
makedepends=(linux-headers)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('933de2e4d1b2211a638be463eb6e8616891bfba73aef5d38060bd8319baeefc6')

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
