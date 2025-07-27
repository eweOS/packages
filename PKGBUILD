# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libinih
pkgver=61
pkgrel=1
pkgdesc='A simple .INI file parser written in C'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://github.com/benhoyt/inih
license=(BSD)
depends=('llvm-libs' 'musl')
makedepends=('meson')
provides=('libinih.so' 'libINIReader.so')
source=(https://github.com/benhoyt/inih/archive/refs/tags/r${pkgver}.tar.gz)
sha512sums=('b02c550d320ad37a859014bc13d53bc4289197c605f2e5414537e602df45299cb7d39be3f80b5b22b42320102655dd36da4d365fd394ca9c26ebba5f5c062a14')

build() {
  ewe-meson inih-r${pkgver} build \
    -Ddefault_library=shared \
    -Ddistro_install=true \
    -Dwith_INIReader=true
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm 644 inih-r${pkgver}/LICENSE.txt -t "${pkgdir}"/usr/share/licenses/libinih/
}
