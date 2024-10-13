# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pacman-mirrorlist
pkgver=20241013
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
sha256sums=('940bba69fe07360e60c6b950781962fc13a8b606132d671f85c8155688bed824')
