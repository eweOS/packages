# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pacman-mirrorlist
pkgver=20241201
pkgrel=1
pkgdesc="eweOS mirror list for use by pacman"
arch=('any')
url="https://os.ewe.moe"
license=('GPL')
backup=(etc/pacman.d/mirrorlist)
source=(mirrorlist)

package() {
  mkdir -p "$pkgdir/etc/pacman.d"
  install -m644 "$srcdir/mirrorlist" "$pkgdir/etc/pacman.d/"
}
sha256sums=('a6700e986c065fbc62c05f74641303d43a5d5dacf54890a2bf1e258882195868')
