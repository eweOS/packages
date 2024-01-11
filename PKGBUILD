# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=btop
pkgver=1.3.0
pkgrel=1
pkgdesc='A monitor of system resources, bpytop ported to C++'
arch=(x86_64 aarch64 riscv64)
url="https://github.com/aristocratos/$pkgname"
license=(Apache)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz" "fix-build.patch")
sha256sums=('375e078ce2091969f0cd14030620bd1a94987451cf7a73859127a786006a32cf'
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
