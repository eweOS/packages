# Maintainer: Yukari Chiba <i@0x7f.cc> 

pkgbase=font-awesome
pkgname=(otf-awesome)
pkgver=7.3.1
pkgrel=1
pkgdesc="The iconic SVG, font, and CSS toolkit"
url="https://fontawesome.com/"
license=('OFL-1.1-RFN')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FortAwesome/Font-Awesome/archive/$pkgver.tar.gz")
sha256sums=('d5a20554faa1ad30148b05f090a556e23495c446435c8dfc1624d3c0e3c2640b')

package_otf-awesome() {
  provides=(font-awesome)
  cd "Font-Awesome-${pkgver}"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 ./otfs/*.otf "$pkgdir/usr/share/fonts/OTF"
}
