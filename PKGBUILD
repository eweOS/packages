# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

_name=caladea
pkgbase=font-$_name
pkgname=({otf,ttf}-$_name)
_commit=336a529cfad3d103d6527752686f8331d13e820a
pkgver=20200211.${_commit:0:8}
pkgrel=1
pkgdesc='A free modern, friendly serif font family based on Cambo'
arch=(any)
url=https://fonts.google.com/specimen/Caladea
license=(OFL-1.1)
provides=(font-base $pkgbase)
source=($pkgbase-$pkgver.tar.gz::https://github.com/huertatipografica/Caladea/archive/$_commit.tar.gz)
sha256sums=(959ccb46ba0f24291545ad591b57a33533513578e2132e82354ab54cb7fd6e13)

package_otf-caladea() {
  cd Caladea-$_commit
  install -Dm644 -t "$pkgdir"/usr/share/fonts/OTF fonts/otf/*
  _install_license_ OFL.txt
}

package_ttf-caladea() {
  cd Caladea-$_commit
  install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF fonts/ttf/*.ttf
  _install_license_ OFL.txt
}
