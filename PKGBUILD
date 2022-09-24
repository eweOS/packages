# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pam
pkgver=1.5.2
pkgrel=1
pkgdesc="PAM (Pluggable Authentication Modules) library"
arch=('x86_64')
license=('GPL2')
url="http://linux-pam.org"
depends=('musl' 'libxcrypt' 'utmps')
makedepends=('flex')
source=(https://github.com/linux-pam/linux-pam/releases/download/v$pkgver/Linux-PAM-$pkgver.tar.xz)
sha256sums=('SKIP')
options=('!emptydirs')

build() {
  cd Linux-PAM-$pkgver
  ./configure \
    --libdir=/usr/lib \
    --sbindir=/usr/bin \
    --disable-db
  make
}

package() {
  cd Linux-PAM-$pkgver
  make DESTDIR="$pkgdir" SCONFIGDIR=/etc/security install
  chmod +s "$pkgdir"/usr/bin/unix_chkpwd
}
