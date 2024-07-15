# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pacman-mirrorlist
pkgver=20240715
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
sha256sums=('9c45f4717bc4c8d7dc33345e5ce258a68d61dabaa6c8e5c7a06bc141d00c6c7a')
