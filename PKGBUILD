# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=openttd-opengfx
pkgver=7.1
pkgrel=1
pkgdesc='A free graphics set for openttd'
arch=('any')
url='https://dev.openttdcoop.org/projects/opengfx'
license=('GPL')
source=("https://cdn.openttd.org/opengfx-releases/${pkgver}/opengfx-${pkgver}-all.zip")
sha256sums=('928fcf34efd0719a3560cbab6821d71ce686b6315e8825360fba87a7a94d7846')

package() {
    cd "${srcdir}"
    tar xvf "opengfx-${pkgver}.tar"
    cd opengfx-${pkgver}
    install -d "${pkgdir}"/usr/share/openttd/data   
    install -m644 *.grf "${pkgdir}"/usr/share/openttd/data
    install -m644 *.obg "${pkgdir}"/usr/share/openttd/data
}
