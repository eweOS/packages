# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=dash
pkgver=0.5.12
pkgrel=1
pkgdesc='POSIX compliant shell that aims to be as small as possible'
url='http://gondor.apana.org.au/~herbert/dash/'
arch=(x86_64 aarch64)
license=('BSD')
depends=('musl' 'libedit')
install=dash.install
source=(https://git.kernel.org/pub/scm/utils/dash/dash.git/snapshot/${pkgname}-${pkgver}.tar.gz)
sha512sums=('a5d2347465c0bad09a2921ecb55fb4e7fe451d627ed43c1da82b92259b539857c7a7f153dfee73cea4befcbb34388bb3585845148631262dfe6dec87390f049c')

prepare()
{
  cd ${pkgname}-${pkgver}
  autoreconf -fiv
}

build()
{
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --mandir=/usr/share/man \
    --exec-prefix="" \
    --with-libedit
  make V=1
}

check()
{
  cd ${pkgname}-${pkgver}
  ./src/dash -c "echo ok"
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
