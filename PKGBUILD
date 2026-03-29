# Maintainer: Eric Long <i@hack3r.moe>

pkgbase=font-roboto
pkgname=(ttf-roboto ttf-roboto-variable)
pkgver=3.015
pkgrel=1
pkgdesc="Google's signature family of fonts"
url='https://fonts.google.com/specimen/Roboto'
arch=(any)
license=(OFL-1.1-RFN)
source=("https://github.com/googlefonts/roboto-3-classic/releases/download/v$pkgver/Roboto_v$pkgver.zip"
        "https://raw.githubusercontent.com/googlefonts/roboto-3-classic/v$pkgver/OFL.txt")
sha256sums=('bee3e9334ea86dd63e184598f31fb16750881c2da1a6f097a66e0f66a95b3d54'
            '061402327a96aadb0bfb694a960ed289ecd38d383e396243831ab81feb109c41')

package_ttf-roboto() {
  provides=($pkgbase font-base)
  install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF hinted/static/*.ttf
  _install_license_ OFL.txt
}

package_ttf-roboto-variable() {
  pkgdesc+=" - variable font"
  # have the same font name as the static version
  provides=(ttf-roboto $pkgbase font-base)
  conflicts=(ttf-roboto)

  install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF hinted/Roboto[ital,wdth,wght].ttf
  _install_license_ OFL.txt
}
