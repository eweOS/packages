# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libutempter
pkgver=1.2.1
pkgrel=2
pkgdesc="Interface for terminal emulators such as screen and xterm to record user sessions to utmp and wtmp files"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="http://ftp.altlinux.org/pub/people/ldv/utempter"
license=('LGPL')
makedepends=('git')
source=(git+https://github.com/altlinux/libutempter.git#tag=${pkgver}-alt1)
sha512sums=('bccc24f5ad32f10038941907159eb27e711e1228e57765cb5ced97003117779371b364f5b9a7b4cc20086281858109f9725a543c64525b3f3120c4082fc7b432')

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
