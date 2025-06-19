# Maintainer: Eric Long <i@hack3r.moe>

pkgbase=font-roboto
pkgname=(ttf-roboto ttf-roboto-variable)
pkgver=3.011
pkgrel=1
pkgdesc="Google's signature family of fonts"
url='https://fonts.google.com/specimen/Roboto'
arch=(any)
license=(OFL-1.1-RFN)
source=("https://github.com/googlefonts/roboto-3-classic/releases/download/v$pkgver/Roboto_v$pkgver.zip"
        "https://raw.githubusercontent.com/googlefonts/roboto-3-classic/v$pkgver/OFL.txt")
sha256sums=('989fee31706df293f1099a385b392bd2e4a152c993ee5fb3ba72adc7484e750e'
            '061402327a96aadb0bfb694a960ed289ecd38d383e396243831ab81feb109c41')

package_ttf-roboto() {
  install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF hinted/static/*.ttf
  _install_license_ OFL.txt
}

package_ttf-roboto-variable() {
  pkgdesc+=" - variable font"
  # have the same font name as the static version
  provides=(ttf-roboto)
  conflicts=(ttf-roboto)

  install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF hinted/Roboto[ital,wdth,wght].ttf
  _install_license_ OFL.txt
}
