# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tty2socket
pkgver=0.2.0
pkgrel=1
pkgdesc="An adaptor from stdin & stdout to (UNIX) socket"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/eweOS/tty2socket"
license=(MIT)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('307e7bc222aa4d6b5099ba1e793845f8f3a53186872e6374ddc8ef3e122f72be')

build()
{
  cd $pkgname-$pkgver
  cc tty2socket.c -o $pkgname
}

package()
{
  install -D $pkgname-$pkgver/$pkgname $pkgdir/usr/bin/$pkgname
}
