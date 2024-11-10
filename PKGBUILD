# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=icu
pkgver=76.1
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://icu.unicode.org"
license=('custom:icu')
depends=('llvm-libs' 'sh')
makedepends=('python')
provides=(libicu{data,i18n,io,test,tu,uc}.so)
source=(
  https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/${pkgname}4c-${pkgver//./_}-src.tgz
)
sha512sums=('b702ab62fb37a1574d5f4a768326d0f8fa30d9db5b015605b5f8215b5d8547f83d84880c586d3dcc7b6c76f8d47ef34e04b0f51baa55908f737024dd79a42a6c')

prepare()
{
  cp /usr/share/autoconf/build-aux/config.{guess,sub} icu/source
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
