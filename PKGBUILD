# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libinih
pkgver=60
pkgrel=1
pkgdesc='A simple .INI file parser written in C'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://github.com/benhoyt/inih
license=(BSD)
depends=('llvm-libs' 'musl')
makedepends=('meson')
provides=('libinih.so' 'libINIReader.so')
source=(https://github.com/benhoyt/inih/archive/refs/tags/r${pkgver}.tar.gz)
sha512sums=('b58ac2395ed8e2b3fa25c3c41260ac5c6ee445d5a6520a79a4392741b417c0ea5ede12d5d89b92f8c4a9c555ff41745ea4f18b78ccbe5117eaa4c723de03b50a')

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
