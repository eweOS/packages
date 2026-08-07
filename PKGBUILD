# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

_name=carlito
pkgbase=font-$_name
pkgname=ttf-$_name
pkgver=20230309
_commit=3a810cab78ebd6e2e4eed42af9e8453c4f9b850a
pkgrel=1
pkgdesc='A font designed derived from Lato that is metric-compatible with Calibri'
arch=(any)
url=https://fonts.google.com/specimen/Carlito
license=(OFL-1.1)
provides=(font-base $pkgbase)
source=($pkgbase-$pkgver.tar.gz::https://github.com/googlefonts/carlito/archive/$_commit.tar.gz)
sha256sums=(ff1fdae06e67136660c7d8135323631c7465c6b4d299d4281bb44eed2165091f)

package() {
  cd $_name-$_commit
  install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF fonts/ttf/*.ttf
  _install_license_ OFL.txt
}
