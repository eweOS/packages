# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pawprint
pkgver=0.1.0
pkgrel=2
pkgdesc="A substitution of systemd-tmpfiles"
url="https://github.com/eweOS/pawprint"
license=(MIT)
arch=(x86_64 aarch64)
makedepends=(git)
source=(
  "$pkgname::git+$url.git#branch=main"
  "$pkgname.service"
)
sha256sums=('SKIP'
            '6fb6b01c1acaf14e6fd30d1a91c0c40d12f447352d83eaa2bf9e5a0d077c0a0e')

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
