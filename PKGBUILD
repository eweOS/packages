# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libpwquality
pkgver=1.4.5
pkgrel=1
pkgdesc='Library for password quality checking and generating random passwords'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/libpwquality/libpwquality'
license=('BSD-3-Clause OR GPL-2.0-or-later')
depends=(cracklib pam)
optdepends=('python: Python bindings')
makedepends=(git python-setuptools)
backup=(etc/security/pwquality.conf)
source=("git+https://github.com/libpwquality/libpwquality.git#tag=$pkgname-$pkgver")
sha256sums=('0f4914657fcc7eb71ed7ba4b81feb382ab386d8ded72896f9ad4c520d3d2f252')

prepare() {
  cd $pkgname

  # Use setuptools instead of distutils
  # https://github.com/libpwquality/libpwquality/pull/74
  git cherry-pick -n 7b5e0f0097faebdcc6a8b783237bbba7a983147a

  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-pam
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir"/etc/security/pwquality.conf.d
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}

