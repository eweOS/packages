# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=openttd-opensfx
pkgver=1.0.3
pkgrel=1
pkgdesc="Free sound set for openttd"
arch=('any')
url="https://www.openttd.org"
license=('CCPL' 'GPL2' 'CDDL')
source=(https://cdn.openttd.org/opensfx-releases/${pkgver}/opensfx-${pkgver}-all.zip)
sha256sums=('e0a218b7dd9438e701503b0f84c25a97c1c11b7c2f025323fb19d6db16ef3759')

prepare() {
  tar -xvf opensfx-${pkgver}.tar
}

build() {
  cd opensfx-${pkgver}

  chmod 0644 *
}

package() {
  cd opensfx-${pkgver}

  mkdir -pm0755 "${pkgdir}"/usr/share/openttd/data   
  cp opensfx.* "${pkgdir}"/usr/share/openttd/data/
  install -Dm644 license.txt "${pkgdir}"/usr/share/licenses/${pkgname}/license
  install -Dm644 readme.txt "${pkgdir}"/usr/share/licenses/${pkgname}/readme
}
