# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

_name=cousine
pkgbase=font-$_name
pkgname=(otf-$_name ttf-$_name)
pkgver=1.241
pkgrel=1
pkgdesc='An innovative, refreshing sans serif design that is metrically compatible with Courier New™'
arch=(any)
url=https://fonts.google.com/specimen/Cousine
license=(OFL-1.1)
provides=(font-base $pkgbase)
source=($pkgbase-$pkgver.tar.gz::https://github.com/googlefonts/$_name/releases/download/v$pkgver/$_name-v$pkgver.zip)
sha256sums=(05e98396538fe59bddab7d631467a9a93b17f8461c7673d493c5b72dc37610e7)

package_otf-cousine() {
  cd $_name-v$pkgver
  install -Dm644 -t "$pkgdir"/usr/share/fonts/OTF fonts/otf/*
  _install_license_ OFL.txt
}

package_ttf-cousine() {
  cd $_name-v$pkgver
  install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF fonts/ttf/*
  _install_license_ OFL.txt
}
