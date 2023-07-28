# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=catnest
pkgver=0.1.0
pkgrel=6
pkgdesc="A substitution of systemd-sysusers"
url="https://github.com/eweOS/catnest"
license=(MIT)
arch=(x86_64 aarch64 riscv64)
source=(
  "$url/archive/refs/tags/v$pkgver.tar.gz"
  "$pkgname.service"
  "basic.conf"
)
sha256sums=('738a5fb3ed40747cf56d931174dc8d4e6722722d6607d6c1c39e9c1432deaaf0'
            '6e5f1aa9f651da19d582f88c0c21a932f9095fc32bfb2bc3df7cbc511eea334e'
            '23f9c703fb4cb7887cc91a3137e139f8d3b2b1bc43f2cb597c94a1707f47be58')

build()
{
  cd $pkgname-$pkgver
  cc -o $pkgname $pkgname.c -DARCH=$arch
}

package()
{
  cd $pkgname-$pkgver
  install -D $pkgname $pkgdir/usr/bin/$pkgname
  install -D ../$pkgname.service $pkgdir/etc/dinit.d/$pkgname
  install -D ../basic.conf $pkgdir/usr/lib/sysusers.d/00-basic.conf
  install -D $pkgname.1 $pkgdir/usr/share/man/man1/$pkgname.1
  install -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
