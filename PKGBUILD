# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tdb
pkgver=1.4.12
pkgrel=1
pkgdesc='Trivial Database similar to GDBM but allows simultaneous commits'
arch=(x86_64 aarch64 riscv64)
license=('GPL-3.0-or-later')
url="https://tdb.samba.org/"
makedepends=('python' 'libxslt' 'docbook-xsl')
optdepends=('python: for python bindings')
provides=(libtdb.so)
source=(https://samba.org/ftp/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('6ce4b27498812d09237ece65a0d6dfac0941610e709848ecb822aa241084cd7a')

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
