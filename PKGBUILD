# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libinih
pkgver=58
pkgrel=1
pkgdesc='A simple .INI file parser written in C'
arch=(x86_64 aarch64 riscv64)
url=https://github.com/benhoyt/inih
license=(BSD)
depends=('llvm-libs' 'musl')
makedepends=('meson')
provides=('libinih.so' 'libINIReader.so')
source=(https://github.com/benhoyt/inih/archive/refs/tags/r${pkgver}.tar.gz)
sha512sums=('d69f488299c1896e87ddd3dd20cd9db5848da7afa4c6159b8a99ba9a5d33f35cadfdb9f65d6f2fe31decdbadb8b43bf610ff2699df475e1f9ff045e343ac26ae')

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
