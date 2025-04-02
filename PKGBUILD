# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=icu
pkgver=77.1
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
sha512sums=('a47d6d9c327d037a05ea43d1d1a06b2fd757cc02a94f7c1a238f35cfc3dfd4ab78d0612790f3a3cca0292c77412a9c2c15c8f24b718f79a857e007e66f07e7cd')

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
