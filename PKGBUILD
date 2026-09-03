# Maintainer: Julian Droske <juliandroske@outlook.com>

pkgname=mdev-helpers
_commit='d33ea4e39d8385a0407109e347bdce45314385ef'
pkgver="20260901.${_commit:0:8}"
pkgrel=2
pkgdesc="mdev helper scripts from mdev-like-a-boss"
arch=('any')
url="https://github.com/eweOS/mdev-helpers"
license=('BSD-3-Clause')
depends=(busybox)
# ethtool: See https://github.com/eweOS/packages/commit/570d860717f0b86bb5c84140fa6b8e7002287520
optdepends=(
  'ethtool: helps getting real mac addresses from nics'
)
backup=(
  'etc/mdev.conf'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
)
sha256sums=('704de80553e132f15275b778faa7f9f324aeea83c672dda8030699fb58119bd0')

package() {
  cd "$srcdir/$pkgname-$_commit"

  install -d "$pkgdir/etc" "$pkgdir/usr/bin"
  install -m 0644 mdev.conf "$pkgdir/etc/"
  for helper in dev-bus-usb settle-nics sound-control storage-device; do
    install -Dm 0755 "mdev-helper-$helper" "$pkgdir/usr/bin/mdev-helper-$helper"
  done

  _install_license_ LICENSE
}
