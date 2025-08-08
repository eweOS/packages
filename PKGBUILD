# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tdb
pkgver=1.4.14
pkgrel=1
pkgdesc='Trivial Database similar to GDBM but allows simultaneous commits'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-3.0-or-later')
url="https://tdb.samba.org/"
makedepends=('python' 'libxslt' 'docbook-xsl')
optdepends=('python: for python bindings')
provides=(libtdb.so)
source=(https://samba.org/ftp/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('144f407d42ed7a0ec1470a40ef17ad41133fe910bce865dd9fe084d49c907526')

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
