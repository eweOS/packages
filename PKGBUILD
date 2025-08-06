# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libutempter
pkgver=1.2.3
pkgrel=1
pkgdesc="Interface for terminal emulators such as screen and xterm to record user sessions to utmp and wtmp files"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="http://ftp.altlinux.org/pub/people/ldv/utempter"
license=('LGPL')
makedepends=('git')
source=(git+https://github.com/altlinux/libutempter.git#tag=${pkgver}-alt1)
sha512sums=('71519006a2e9ae81953c07c62d05e6bc9a0a8ab6ccb39c218e9b80bb2a7a86d2ed05bf32c4775cd240a2c145bc40e9e71dd9e00161bdfaeee41b808d66a26532')

prepare() {
  cd $pkgname/$pkgname
  sed -i '1i #define _PATH_UTMP "/var/run/utmp"' utempter.c
  sed -i '1i #define _PATH_WTMP "/var/log/wtmp"' utempter.c
}

build() {
  cd $pkgname/$pkgname
  make
}

package() {
  cd $pkgname/$pkgname
  make DESTDIR="$pkgdir" install
  echo 'z /usr/lib/utempter/utempter 2755 root utmp -' | install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
