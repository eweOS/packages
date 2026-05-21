# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=icu
pkgver=78.2
pkgrel=2
pkgdesc="International Components for Unicode library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://icu.unicode.org"
license=('custom:icu')
depends=('llvm-libs' 'sh')
makedepends=('python')
provides=(libicu{data,i18n,io,test,tu,uc}.so)
source=(
  https://github.com/unicode-org/icu/releases/download/release-$pkgver/icu4c-$pkgver-sources.tgz
)
sha512sums=('92feddfe81c57336f386c7cbc9f6d976bf349db148a77a247c4559676f51116115c8c52c4d907feb50933f72ab75fd8e48be092bf9c8ca33a3e8fabc9372a5d6')

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
