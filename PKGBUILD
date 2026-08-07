# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

_name=arimo
pkgbase=font-$_name
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=1.341
_commit=4a6255f269916ae7ad3fc2706b0935e7621396b8
pkgrel=1
pkgdesc='An innovative, refreshing sans serif design that is metrically compatible with Arial™'
arch=(any)
url=https://fonts.google.com/specimen/Arimo
license=(OFL-1.1)
provides=(font-base $pkgbase)
source=($pkgbase-$pkgver.tar.gz::https://github.com/googlefonts/Arimo/archive/$_commit.tar.gz)
sha256sums=(3d855617e6d0f8c103cc20e527239db721e9168847490b35688f53650ea23566)

package_otf-arimo() {
  cd Arimo-$_commit
  install -Dm644 -t "$pkgdir"/usr/share/fonts/OTF fonts/otf/*
  _install_license_ OFL.txt
}

package_ttf-arimo() {
  cd Arimo-$_commit
  install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF fonts/ttf/*
  _install_license_ OFL.txt
}

package_ttf-arimo-variable() {
  provides+=(ttf-$_name)

  cd Arimo-$_commit
  install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF fonts/variable/*
  _install_license_ OFL.txt
}
