# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=papirus-icon-theme
pkgver=20260801
pkgrel=1
pkgdesc="Papirus icon theme"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"
license=("GPL-3.0-only")
depends=('gtk-update-icon-cache')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b26363aef40f0a51344197c72576a08a0e66b63bad8d99ec983842258464c0649e9d72459f3dfcb2589d0209bf8103281be76db903fb305dbf5e14e79d0844ce')
options+=(!strip)

package_papirus-icon-theme() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" ICON_THEMES="Papirus Papirus-Dark Papirus-Light" install
}
