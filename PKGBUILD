# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tty2socket
pkgver=0.1.1
pkgrel=1
pkgdesc="An adaptor from stdin & stdout to (UNIX) socket"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/eweOS/tty2socket"
license=(MIT)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a4177243d66449d77ac2f0a5a2a7e64a223f45c25e7bfb0aebb44bf69c7da690')

build()
{
  cd $pkgname-$pkgver
  cc tty2socket.c -o $pkgname
}

package()
{
  install -D $pkgname-$pkgver/$pkgname $pkgdir/usr/bin/$pkgname
}
