# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=autoconf
pkgver=2.72
pkgrel=1
pkgdesc='A tool that produces shell scripts to automatically configure source code.'
arch=('any')
license=(GPL3)
url="http://www.gnu.org/software/autoconf"
groups=('base-devel')
depends=('busybox' 'm4' 'bash')
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz")
md5sums=('1be79f7106ab6767f18391c5e22be701')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -rf "${pkgdir:?}/usr/share/"{info,doc}
}
