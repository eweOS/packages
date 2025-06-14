# Maintainer: Eric Long <i@hack3r.moe>

pkgbase=font-inter
pkgname=(ttf-inter ttf-inter-variable)
pkgver=4.1
pkgrel=1
pkgdesc='A typeface specially designed for user interfaces'
url='https://github.com/rsms/inter'
license=(OFL-1.1-RFN)
arch=(any)
source=("$url/releases/download/v$pkgver/Inter-$pkgver.zip")
sha256sums=('9883fdd4a49d4fb66bd8177ba6625ef9a64aa45899767dde3d36aa425756b11e')

package_ttf-inter() {
  install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF Inter.ttc
  _install_license_ LICENSE.txt
}

package_ttf-inter-variable() {
  pkgdesc+=' - variable font'
  install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF InterVariable{,-Italic}.ttf
  _install_license_ LICENSE.txt
}
