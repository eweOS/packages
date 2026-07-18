# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libva-utils
pkgver=2.24.0
pkgrel=1
pkgdesc="Intel VA-API Media Applications and Scripts for libva"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/intel/libva-utils"
license=(custom)
depends=(libva)
makedepends=(mesa meson linux-headers)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('bf959a1ced3cde8176a7ff50ad358ee98e93301ac068581a8b2617c5b83afcb3')

build() {
    ewe-meson ${pkgname}-${pkgver} build
    meson compile -C build
}

package() {
    DESTDIR="${pkgdir}" meson install -C build
    install -Dm644 ${pkgname}-${pkgver}/COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
