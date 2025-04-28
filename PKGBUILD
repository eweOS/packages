# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=btop
pkgver=1.4.1
pkgrel=1
pkgdesc='A monitor of system resources, bpytop ported to C++'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/aristocratos/$pkgname"
license=(Apache)
makedepends=(linux-headers)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz" "fix-build.patch")
sha256sums=('40f6c54d1bc952c674b677d81dd25f55b61e9c004883c27950dc30780c86f381'
            '37925823055ecbf1cfd44eedcee525c53b35c53624fd7546eda9ffb878d5a26a')

prepare()
{
  cd $pkgname-$pkgver
  patch -p1 < $srcdir/fix-build.patch
}

build()
{
  make -C $pkgname-$pkgver OPTFLAGS= all
}

package()
{
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" PREFIX=/usr install
}
