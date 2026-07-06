# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pacman-mirrorlist
pkgver=20260706
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
sha256sums=('c2437e71eb6523858a2e68910a295b86d730bf1a78db35716b55c040d476d847')
