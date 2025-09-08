# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pacman-mirrorlist
pkgver=20250908
pkgrel=1
pkgdesc="eweOS mirror list for use by pacman"
arch=('any')
url="https://os.ewe.moe"
license=('GPL-2.0-or-later')
backup=(etc/pacman.d/mirrorlist)
source=(mirrorlist)

package() {
  mkdir -p "$pkgdir/etc/pacman.d"
  install -m644 "$srcdir/mirrorlist" "$pkgdir/etc/pacman.d/"
}
sha256sums=('53ba93384836c97da0967cdce5443ed4abcde17e39c334374af15d40c8a5564c')
