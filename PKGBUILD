# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libva-utils
pkgver=2.23.0
pkgrel=2
pkgdesc="Intel VA-API Media Applications and Scripts for libva"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/intel/libva-utils"
license=(custom)
depends=(libva)
makedepends=(mesa meson linux-headers)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('fa7ff29847b55010fbbb775b35382f97f29b7b97abe9a2f6fb3e22b36db5440a')

build() {
    ewe-meson ${pkgname}-${pkgver} build
    meson compile -C build
}

package() {
    DESTDIR="${pkgdir}" meson install -C build
    install -Dm644 ${pkgname}-${pkgver}/COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
