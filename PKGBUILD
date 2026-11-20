# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libinih
pkgver=63
pkgrel=1
pkgdesc='A simple .INI file parser written in C'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://github.com/benhoyt/inih
license=(BSD)
depends=('llvm-libs' 'musl')
makedepends=('meson')
provides=('libinih.so' 'libINIReader.so')
source=(https://github.com/benhoyt/inih/archive/refs/tags/r${pkgver}.tar.gz)
sha512sums=('0aede2f2dbb70e6ee855743045d423a0f399c6361f84813be5b912ca84b4dfe40013857b91390d9b156f8bc53067582ea66e6c7de339f4b0fb7436b10143a059')

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
