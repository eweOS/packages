# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=signify
pkgver=31
pkgrel=1
pkgdesc='OpenBSD tool to signs and verify signatures on files'
url='https://github.com/aperezdc/signify'
arch=('x86_64')
license=('ISC')
depends=('musl' 'libbsd')
makedepends=('bsd-compat-headers')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
	signify-b64.patch)
sha512sums=('SKIP' 'SKIP')

prepare() {
  cd ${pkgname}-${pkgver}
  # check if still needed in next version
  patch signify.c $srcdir/signify-b64.patch
}

build () {
  cd ${pkgname}-${pkgver}
  make -j1 EXTRA_CFLAGS="${CFLAGS}" EXTRA_LDFLAGS="${LDFLAGS}"
}

check() {
  cd ${pkgname}-${pkgver}
  # need coreutils sha256sum
  #make check
}

package () {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr \
    DESTDIR="${pkgdir}" \
    GIT_TAG='' install

  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
