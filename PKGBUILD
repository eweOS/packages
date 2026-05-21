# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=autoconf
pkgver=2.73
pkgrel=2
pkgdesc='A tool that produces shell scripts to automatically configure source code.'
arch=('any')
license=(GPL3)
url="http://www.gnu.org/software/autoconf"
depends=('busybox' 'm4' 'bash')
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz")
md5sums=('9cbad9a116ef845bafeed8e7bc771bf4')

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
