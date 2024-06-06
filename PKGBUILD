# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libva-utils
pkgver=2.21.0
pkgrel=1
pkgdesc="Intel VA-API Media Applications and Scripts for libva"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/intel/libva-utils"
license=(custom)
depends=(libva)
makedepends=(mesa meson linux-headers)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('15ca12bd11c7001c04af5079512754fea6ba8d79151b9f07908c99b27622714e')

build() {
    ewe-meson ${pkgname}-${pkgver} build
    meson compile -C build
}

package() {
    DESTDIR="${pkgdir}" meson install -C build
    install -Dm644 ${pkgname}-${pkgver}/COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
