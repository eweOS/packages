# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pawprint
pkgver=0.1.0
pkgrel=1
pkgdesc="A substitution of systemd-tmpfiles"
url="https://github.com/eweOS/pawprint"
license=(MIT)
arch=(x86_64 aarch64)
makedepends=(git)
source=(
  "$pkgname::git+$url.git#branch=main"
  "$pkgname.service"
)
sha256sums=('SKIP' 'SKIP')

build()
{
  cd $pkgname
  cc -o $pkgname $pkgname.c -DARCH=$arch
}

package()
{
  cd $pkgname
  install -D $pkgname $pkgdir/usr/bin/$pkgname
  install -d $pkgdir/etc/tmpfiles.d
  install -D ../$pkgname.service $pkgdir/etc/dinit.d/$pkgname
}
