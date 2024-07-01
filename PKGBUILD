# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libva-utils
pkgver=2.22.0
pkgrel=1
pkgdesc="Intel VA-API Media Applications and Scripts for libva"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/intel/libva-utils"
license=(custom)
depends=(libva)
makedepends=(mesa meson linux-headers)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('7b57615c130427ec134bb5d2b80af516ce5bb19a40e89b1dab46a0d59760d96c')

build() {
    ewe-meson ${pkgname}-${pkgver} build
    meson compile -C build
}

package() {
    DESTDIR="${pkgdir}" meson install -C build
    install -Dm644 ${pkgname}-${pkgver}/COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
