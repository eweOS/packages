# Maintainer: YukariChiba <i@0x7f.cc>

pkgname=pam_rundir
pkgver=1.0.0
pkgrel=2
pkgdesc='PAM module to provide user runtime directory on Linux systems '
arch=(x86_64 aarch64 riscv64)
url="http://jjacky.com/$pkgname"
license=('GPL2+')
depends=("pam")
source=("$url/$pkgname-$pkgver.tar.gz")
sha256sums=('c779b699ed23777a3bdba87b7f67ed395fe957f3c96138faee45f87a27bcc020')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-parentdir=/run/user
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
