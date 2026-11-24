# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=wget
pkgver=1.25.0
pkgrel=3
pkgdesc='Network utility to retrieve files from the Web'
url='https://www.gnu.org/software/wget/wget.html'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL3')
depends=('libidn2' 'openssl' 'pcre2')
makedepends=('perl')
checkdepends=('perl-http-daemon')
backup=('etc/wgetrc')
# 0001: Backport aaec8d52a06c ("* src/openssl.c (ssl_init): Fix build for
#	OpenSSL 4.0.0"). SSLv3_client_method() is removed in OpenSSL 4.
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.lz"
	0001-src-openssl-c-ssl-init-Fix-build-for-OpenSSL-4.0.0.patch)
sha512sums=('79403f594636e5d703817ceec59e5155940cd4734746ef793ef3bdabd100d0014a44c5e24f705656cf1e0762d87003fa1dc3e1b5605fae392bc9d7f121d90bae'
            'fdbdaf466d07485ba97b57a05979beb290c90871fae884dec28e2a955547c16f8366d964beff7b0a39ee31834c64c49d938e23943a0e8cf9dfb428b751b03e5c')

prepare()
{
  _patch_ $pkgname-$pkgver
}

build()
{
  cd $pkgname-$pkgver
  ./configure \
    --build=$CBUILD \
    --host=$CHOST \
    --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info \
    --with-libidn \
    --with-ssl=openssl \
    --disable-nls
  make
}

check()
{
  cd $pkgname-$pkgver
  make -C tests check
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
