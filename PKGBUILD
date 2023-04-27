# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>

pkgname=icu
pkgver=73.1
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=(x86_64 aarch64)
url="https://icu.unicode.org"
license=('custom:icu')
depends=('llvm-libs' 'sh')
makedepends=('python')
provides=(libicu{data,i18n,io,test,tu,uc}.so)
source=(https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/${pkgname}4c-${pkgver//./_}-src.tgz)
sha512sums=('e788e372716eecebc39b56bbc88f3a458e21c3ef20631c2a3d7ef05794a678fe8dad482a03a40fdb9717109a613978c7146682e98ee16fade5668d641d5c48f8')

build()
{
  cd icu/source
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man \
    --sbindir=/usr/bin
  make
}

check()
{
  cd icu/source
  make -k check
}

package()
{
  cd icu/source
  make -j1 DESTDIR="${pkgdir}" install

  # Install license
  install -Dm644 "${srcdir}"/icu/LICENSE "${pkgdir}"/usr/share/licenses/icu/LICENSE
}
