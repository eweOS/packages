# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=papirus-icon-theme
pkgname=('papirus-icon-theme' 'epapirus-icon-theme')
pkgver=20240501
pkgrel=1
pkgdesc="Papirus icon theme"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"
license=("GPL3")
depends=('gtk-update-icon-cache')
source=("$url/archive/$pkgver/$pkgbase-$pkgver.tar.gz")
sha512sums=('3b2529d593ffd468c4cf609e421c02cffa55d29bb5a94de990b9924d7ee4df36ec1ead627fc3d35118a368443aa7c102739980dc42f3a3000c91c9d93b88b261')
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
