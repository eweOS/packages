# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=fcgi2
pkgname=fcgi
pkgver=2.4.2
pkgrel=1
pkgdesc="A language independent, high performant extension to CGI"
arch=('x86_64')
license=('custom')
url='http://www.fastcgi.com/'
source=("https://github.com/FastCGI-Archives/${pkgbase}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd ${pkgbase}-${pkgver}
  ./autogen.sh
}

build() {
  cd ${pkgbase}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm0644 LICENSE.TERMS "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

