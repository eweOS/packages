# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>

pkgname=icu
pkgver=74.2
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=(x86_64 aarch64 riscv64)
url="https://icu.unicode.org"
license=('custom:icu')
depends=('llvm-libs' 'sh')
makedepends=('python')
provides=(libicu{data,i18n,io,test,tu,uc}.so)
source=(
  https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/${pkgname}4c-${pkgver//./_}-src.tgz
)
sha512sums=('e6c7876c0f3d756f3a6969cad9a8909e535eeaac352f3a721338b9cbd56864bf7414469d29ec843462997815d2ca9d0dab06d38c37cdd4d8feb28ad04d8781b0')

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
