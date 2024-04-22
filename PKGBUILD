# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=wget
pkgver=1.24.5
pkgrel=1
pkgdesc='Network utility to retrieve files from the Web'
url='https://www.gnu.org/software/wget/wget.html'
arch=(x86_64 aarch64 riscv64)
license=('GPL3')
depends=('libidn2' 'openssl' 'pcre2')
makedepends=('perl')
checkdepends=('perl-http-daemon')
backup=('etc/wgetrc')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.lz")
sha512sums=('d8972e94d9125133d115750542e0f126b85a311634d5563a69d8fe85ecf1200836dcc83528ee4285d56834c58c722be580bfe749b26436158fbe4afc566f5cc0')

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
