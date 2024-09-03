# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sound-theme-freedesktop
pkgver=0.8
pkgrel=1
pkgdesc="Freedesktop sound theme"
arch=(any)
license=('GPL-2.0-only'
         'GPL-2.0-or-later'
         'LGPL-2.0-or-later'
         'CC-BY-SA-3.0'
         'CC-BY-3.0'
         'CC-BY-4.0')
makedepends=('intltool')
source=(https://people.freedesktop.org/~mccann/dist/${pkgname}-${pkgver}.tar.bz2)
url="https://freedesktop.org/wiki/Specifications/sound-theme-spec"
sha512sums=('f08e0414443f3a47bc433a69a7226d2b9383bc7c64e0711e8a605bd761ac69ea052a6db7f0037d88fbf0900efddaae6466ca96391eb71295ee1d0edbd0364621')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/CREDITS" \
    "${pkgdir}/usr/share/licenses/${pkgname}/CREDITS"
}

