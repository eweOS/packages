# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tdb
pkgver=1.4.13
pkgrel=1
pkgdesc='Trivial Database similar to GDBM but allows simultaneous commits'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-3.0-or-later')
url="https://tdb.samba.org/"
makedepends=('python' 'libxslt' 'docbook-xsl')
optdepends=('python: for python bindings')
provides=(libtdb.so)
source=(https://samba.org/ftp/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('5ee276e7644d713e19e4b6adc00b440afb5851ff21e65821ffaed89e15a5e167')

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
