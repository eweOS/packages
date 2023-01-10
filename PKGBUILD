# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=wget
pkgver=1.21.3
pkgrel=1
pkgdesc='Network utility to retrieve files from the Web'
url='https://www.gnu.org/software/wget/wget.html'
arch=(x86_64 aarch64)
license=('GPL3')
depends=('libidn2' 'openssl')
makedepends=('perl')
checkdepends=('perl-http-daemon')
backup=('etc/wgetrc')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.lz")
sha512sums=('SKIP')

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
