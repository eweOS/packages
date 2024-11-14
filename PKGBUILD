# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=wget
pkgver=1.25.0
pkgrel=1
pkgdesc='Network utility to retrieve files from the Web'
url='https://www.gnu.org/software/wget/wget.html'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL3')
depends=('libidn2' 'openssl' 'pcre2')
makedepends=('perl')
checkdepends=('perl-http-daemon')
backup=('etc/wgetrc')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.lz")
sha512sums=('79403f594636e5d703817ceec59e5155940cd4734746ef793ef3bdabd100d0014a44c5e24f705656cf1e0762d87003fa1dc3e1b5605fae392bc9d7f121d90bae')

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
