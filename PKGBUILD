# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=catnest
pkgver=0.1.0
pkgrel=4
pkgdesc="A substitution of systemd-sysusers"
url="https://github.com/eweOS/catnest"
license=(MIT)
arch=(x86_64 aarch64)
source=(
  "$url/archive/refs/tags/v$pkgver.tar.gz"
  "$pkgname.service"
  "basic.conf"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

build() {
  cd $pkgname-$pkgver
  cc -o $pkgname $pkgname.c -DARCH=$arch
}

package() {
  cd $pkgname-$pkgver
  install -D $pkgname $pkgdir/usr/bin/$pkgname
  install -D ../$pkgname.service $pkgdir/etc/dinit.d/$pkgname
  install -D ../basic.conf $pkgdir/usr/lib/sysusers.d/basic.conf
  install -D $pkgname.1 $pkgdir/usr/share/man/man1/$pkgname.1
  install -D LICENSE $pkgdir/usr/share/licenses/$pkgname
}
