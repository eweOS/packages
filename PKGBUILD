# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=rime-emoji
pkgver=17.0
_commit=d1dbb424124fc50452a179300c7f287dbcc0db64
pkgrel=1
pkgdesc='Rime Emoji input schema'
arch=(any)
url=https://github.com/rime/rime-emoji
license=(LGPL-3.0-or-later)
source=($pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz)
sha256sums=(856c2b9315bb90235e606f5ddc7611984fadd8f585e7ec7d03d5a4f6c665e35b)

package() {
  cd $pkgname-$_commit
  install -Dm644 -t "$pkgdir"/usr/share/rime-data emoji_suggestion.yaml
  install -Dm644 -t "$pkgdir"/usr/share/rime-data/opencc opencc/*
}
