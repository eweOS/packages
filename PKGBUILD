# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=rime-prelude
_commit=082425ea0684bca36474415d4a0e8db9b016487e
pkgver=20260509.${_commit:0:8}
pkgrel=3
pkgdesc='Rime essential configuration'
arch=(any)
url=https://github.com/rime/rime-prelude
license=(LGPL-3.0-or-later)
depends=(rime-cangjie rime-bopomofo rime-essay rime-luna-pinyin rime-quick rime-stroke rime-terra-pinyin)
source=($pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz)
sha256sums=(66239ba4745d54471e5ce5540b45e86ec663ff5dba004cb23c95531a3bdec00f)

package() {
  install -Dm644 -t "$pkgdir"/usr/share/rime-data $pkgname-$_commit/*.yaml
}
