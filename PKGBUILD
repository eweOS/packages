# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

_name=tinos
pkgbase=font-$_name
pkgname=(otf-$_name ttf-$_name)
pkgver=1.340
_commit=3b4482a99b80ea5fc75f187b1be3120a3f5905b3
pkgrel=1
pkgdesc='An innovative, refreshing serif design that is metrically compatible with Times New Roman™'
arch=(any)
url=https://fonts.google.com/specimen/Tinos
license=(OFL-1.1)
provides=(font-base $pkgbase)
source=($pkgbase-$pkgver.tar.gz::https://github.com/googlefonts/$_name/archive/$_commit.tar.gz)
sha256sums=(c53319f0158201e7a1a0908a614fb1fee966b144d841f3f431e35ec482aade57)

package_otf-tinos() {
  cd $_name-$_commit
  install -Dm644 -t "$pkgdir"/usr/share/fonts/OTF fonts/otf/*
  _install_license_ OFL.txt
}

package_ttf-tinos() {
  cd $_name-$_commit
  install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF fonts/ttf/*
  _install_license_ OFL.txt
}
