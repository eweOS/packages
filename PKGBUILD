# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=dash
pkgver=0.5.11.5
pkgrel=1
pkgdesc='POSIX compliant shell that aims to be as small as possible'
url='http://gondor.apana.org.au/~herbert/dash/'
arch=('x86_64')
license=('BSD')
depends=('musl' 'libedit')
install=dash.install
source=(https://git.kernel.org/pub/scm/utils/dash/dash.git/snapshot/${pkgname}-${pkgver}.tar.gz)
sha512sums=('SKIP')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --mandir=/usr/share/man \
    --exec-prefix="" \
    --with-libedit
  make V=1
}

check() {
  cd ${pkgname}-${pkgver}
  ./src/dash -c "echo ok"
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
