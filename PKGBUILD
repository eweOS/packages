# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libinih
pkgver=62
pkgrel=1
pkgdesc='A simple .INI file parser written in C'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://github.com/benhoyt/inih
license=(BSD)
depends=('llvm-libs' 'musl')
makedepends=('meson')
provides=('libinih.so' 'libINIReader.so')
source=(https://github.com/benhoyt/inih/archive/refs/tags/r${pkgver}.tar.gz)
sha512sums=('206ddfaa55d29396c3a44f8d1dfcf578c5ebf892e81fe875cd6b4ec2af5cccf400ca13fc6585b6d8232bd122bd8aef7522bfc83898b5609b29c20bad9390ee02')

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
