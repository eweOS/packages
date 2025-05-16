# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=papirus-icon-theme
pkgname=('papirus-icon-theme' 'epapirus-icon-theme')
pkgver=20250501
pkgrel=1
pkgdesc="Papirus icon theme"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"
license=("GPL3")
depends=('gtk-update-icon-cache')
source=("$url/archive/$pkgver/$pkgbase-$pkgver.tar.gz")
sha512sums=('0eca50c296a548733d9cb97f0d9b62cac99d6b1bb473bf016e33188986334b9fc84bc0682e9a6e5339d3d247f2cfefd24a1de3f901de9ffbc9e8a7ad1b5d39f8')
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
