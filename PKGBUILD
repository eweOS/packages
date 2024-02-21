# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=papirus-icon-theme
pkgname=('papirus-icon-theme' 'epapirus-icon-theme')
pkgver=20240201
pkgrel=1
pkgdesc="Papirus icon theme"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"
license=("GPL3")
depends=('gtk-update-icon-cache')
source=("$url/archive/$pkgver/$pkgbase-$pkgver.tar.gz")
sha512sums=('ac4b653e904bcda1a643accd43c8fcda2f4d0b5d9844e92c31e3fe950b440f172a53d0042677b902c41769884be54a06ccb42ea01283104b80daf421a70a6516')
options+=(!strip)

package_papirus-icon-theme() {
  cd $pkgbase-$pkgver
  make DESTDIR="$pkgdir" ICON_THEMES="Papirus Papirus-Dark Papirus-Light" install
}

package_epapirus-icon-theme() {
  depends+=('papirus-icon-theme')

  cd $pkgbase-$pkgver
  make DESTDIR="$pkgdir" ICON_THEMES="ePapirus ePapirus-Dark" install
}
