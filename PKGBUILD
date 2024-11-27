# Maintainer: Yukari Chiba <i@0x7f.cc> 

pkgbase=font-awesome
pkgname=(ttf-font-awesome otf-font-awesome)
pkgver=6.7.1
pkgrel=1
pkgdesc="The iconic SVG, font, and CSS toolkit"
url="https://fontawesome.com/"
license=('custom:OFL')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FortAwesome/Font-Awesome/archive/$pkgver.tar.gz")
sha256sums=('44cd670c44616a943dd43d783f208aacd77c3e43e715e7f4977bc0e5909b8084')

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
