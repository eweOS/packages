# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=btop
pkgver=1.4.5
pkgrel=1
pkgdesc='A monitor of system resources, bpytop ported to C++'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/aristocratos/$pkgname"
license=(Apache)
depends=(musl llvm-libs)
makedepends=(linux-headers)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0ffe03d3e26a3e9bbfd5375adf34934137757994f297d6b699a46edd43c3fc02')

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
