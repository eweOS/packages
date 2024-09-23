# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=btop
pkgver=1.4.0
pkgrel=1
pkgdesc='A monitor of system resources, bpytop ported to C++'
arch=(x86_64 aarch64 riscv64)
url="https://github.com/aristocratos/$pkgname"
license=(Apache)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz" "fix-build.patch")
sha256sums=('ac0d2371bf69d5136de7e9470c6fb286cbee2e16b4c7a6d2cd48a14796e86650'
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
