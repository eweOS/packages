# Maintainer: Eric Long <i@hack3r.moe>

pkgbase=font-roboto-mono
pkgname=(ttf-roboto-mono ttf-roboto-mono-variable)
_pkgname=RobotoMono
pkgver=3.001
pkgrel=1
arch=(any)
pkgdesc="A monospaced addition to the Roboto type family"
url="https://fonts.google.com/specimen/Roboto+Mono"
license=(OFL-1.1-RFN)
source=("https://github.com/googlefonts/RobotoMono/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('677d8513918572700531a3115f721a416557a5c701b150abc4d118a7177c8bdc')

package_ttf-roboto-mono() {
  cd $_pkgname-$pkgver
	install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF fonts/ttf/*.ttf
  _install_license_ OFL.txt
}

package_ttf-roboto-mono-variable() {
  pkgdesc+=" - variable font"
  # have the same font name as the static version
  provides=(ttf-roboto-mono)
  conflicts=(ttf-roboto-mono)

  cd $_pkgname-$pkgver
	install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF fonts/variable/*.ttf
  _install_license_ OFL.txt
}
