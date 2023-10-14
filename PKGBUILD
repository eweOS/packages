# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>

pkgname=icu
pkgver=73.2
pkgrel=2
pkgdesc="International Components for Unicode library"
arch=(x86_64 aarch64 riscv64)
url="https://icu.unicode.org"
license=('custom:icu')
depends=('llvm-libs' 'sh')
makedepends=('python')
provides=(libicu{data,i18n,io,test,tu,uc}.so)
source=(
  https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/${pkgname}4c-${pkgver//./_}-src.tgz
  https://patch-diff.githubusercontent.com/raw/unicode-org/icu/pull/2610.patch
)
sha512sums=(
  '76dd782db6205833f289d7eb68b60860dddfa3f614f0ba03fe7ec13117077f82109f0dc1becabcdf4c8a9c628b94478ab0a46134bdb06f4302be55f74027ce62'
  '4567dde0deac77a7bba7ecd23ee37f7e196ff4daff2b2d6e86f81dfa6994727a87e7c817dcae6bb24515a73a77948132cc2fbf92887d72b00bdd4cd4e143e14a'
)

prepare()
{
  cd icu
  # fix TestHebrewCalendarInTemporalLeapYear
  # https://github.com/unicode-org/icu/pull/2610
  patch -p2 < $srcdir/2610.patch
}

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
