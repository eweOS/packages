# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=btop
pkgver=1.3.2
pkgrel=1
pkgdesc='A monitor of system resources, bpytop ported to C++'
arch=(x86_64 aarch64 riscv64)
url="https://github.com/aristocratos/$pkgname"
license=(Apache)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz" "fix-build.patch")
sha256sums=('331d18488b1dc7f06cfa12cff909230816a24c57790ba3e8224b117e3f0ae03e'
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
