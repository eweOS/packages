# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tdb
pkgver=1.4.15
pkgrel=2
pkgdesc='Trivial Database similar to GDBM but allows simultaneous commits'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-3.0-or-later')
url="https://tdb.samba.org/"
makedepends=('python' 'libxslt' 'docbook-xsl')
optdepends=('python: for python bindings')
provides=(libtdb.so)
source=(https://samba.org/ftp/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('fba09d8df1f1b9072aeae8e78b2bd43c5afef20b2f6deefa633aa14a377a8dd2')

build() {
   cd ${pkgname}-${pkgver}
   ./configure --prefix=/usr \
               --localstatedir=/var \
               --sysconfdir=/etc/samba
   make
}

package() {
   cd ${pkgname}-${pkgver}
   make DESTDIR="$pkgdir" install
}
