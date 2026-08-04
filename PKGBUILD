# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

_name=liberation
pkgbase=font-$_name
pkgname=ttf-$_name
pkgver=2.1.5
pkgrel=1
pkgdesc='A font family which aims at metric compatibility with Arial, Times New Roman, and Courier New'
arch=(any)
url=https://github.com/liberationfonts/liberation-fonts
license=(OFL-1.1-RFN)
makedepends=(fontforge python-fonttools)
provides=(font-base $pkgbase)
source=($pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=(9a823ccb33c8a8a865e84b982bcdc44d03ba4914adb91e6000df035dc0e55936)

build() {
  make -C $_name-fonts-$pkgver DISTPREFIX_TTF=build
}

check() {
  make -C $_name-fonts-$pkgver check
}

package() {
  cd $_name-fonts-$pkgver
  install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF build/*
  _install_license_ LICENSE
}
