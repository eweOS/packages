# Maintainer: Yukari Chiba <i@0x7f.cc> 

pkgbase=font-awesome
pkgname=(otf-awesome)
pkgver=7.2.0
pkgrel=2
pkgdesc="The iconic SVG, font, and CSS toolkit"
url="https://fontawesome.com/"
license=('OFL-1.1-RFN')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FortAwesome/Font-Awesome/archive/$pkgver.tar.gz")
sha256sums=('8f433b74d3d4bbba2a6374a0a0ddf53be8e127809341e4c2578719229b43903a')

package_otf-awesome() {
  provides=(font-awesome)
  cd "Font-Awesome-${pkgver}"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 ./otfs/*.otf "$pkgdir/usr/share/fonts/OTF"
}
