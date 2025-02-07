# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=papirus-icon-theme
pkgname=('papirus-icon-theme' 'epapirus-icon-theme')
pkgver=20250201
pkgrel=1
pkgdesc="Papirus icon theme"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"
license=("GPL3")
depends=('gtk-update-icon-cache')
source=("$url/archive/$pkgver/$pkgbase-$pkgver.tar.gz")
sha512sums=('390bd47cb3069f74fc364a4100c60c5ab87eca6c7796e925464988c360e0b8ca19d61447f496cbc37e26aeb3aa013988a533cb0259846106f78ed55bc9c76f74')
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
