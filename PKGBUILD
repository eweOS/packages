# Maintainer: Yukari Chiba <i@0x7f.cc> 

pkgbase=font-awesome
pkgname=(ttf-font-awesome otf-font-awesome)
pkgver=6.5.2
pkgrel=1
pkgdesc="The iconic SVG, font, and CSS toolkit"
url="https://fontawesome.com/"
license=('custom:OFL')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FortAwesome/Font-Awesome/archive/$pkgver.tar.gz")
sha256sums=('e65e5bb2c7e27d8f3ddddc69d1277bc33ede27c3fe950c5de20500a4ab726dfd')

package_ttf-font-awesome() {
  cd "Font-Awesome-${pkgver}"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 ./webfonts/*.ttf "$pkgdir/usr/share/fonts/TTF"
}

package_otf-font-awesome() {
  cd "Font-Awesome-${pkgver}"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 ./otfs/*.otf "$pkgdir/usr/share/fonts/OTF"
}
