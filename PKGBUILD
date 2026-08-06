# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=rime-essay
_commit=e9b1a374a6ea015fca5bdd04318924b4483ac35a
pkgver=20260713.${_commit:0:8}
pkgrel=1
pkgdesc='Rime shared vocabulary and language model'
arch=(any)
url=https://github.com/rime/rime-essay
license=(LGPL-3.0-or-later)
source=($pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz)
sha256sums=(11559224d48709b0d77009a550804bfc2b763cfdf048c8d8fe224b3d36ba441c)

package() {
  install -Dm644 -t "$pkgdir"/usr/share/rime-data $pkgname-$_commit/essay.txt
}
