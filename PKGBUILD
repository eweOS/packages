# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=openttd-opengfx
pkgver=8.0
pkgrel=1
pkgdesc='A free graphics set for openttd'
arch=('any')
url='https://dev.openttdcoop.org/projects/opengfx'
license=('GPL')
source=("https://cdn.openttd.org/opengfx-releases/${pkgver}/opengfx-${pkgver}-all.zip")
sha256sums=('43a0c1dabf39cb865394f3a6cc36d4da5c10ecfaaf55652043104806810903be')

package() {
    cd "${srcdir}"
    tar xvf "opengfx-${pkgver}.tar"
    cd opengfx-${pkgver}
    install -d "${pkgdir}"/usr/share/openttd/data   
    install -m644 *.grf "${pkgdir}"/usr/share/openttd/data
    install -m644 *.obg "${pkgdir}"/usr/share/openttd/data
}
