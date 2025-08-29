# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=font-noto-emoji
pkgname=ttf-noto-fonts-emoji
pkgver=2.048
pkgrel=1
pkgdesc='Google Noto emoji fonts'
arch=(any)
url='https://www.google.com/get/noto/'
license=(custom:OFL)
provides=(font-emoji)
makedepends=(git)
source=($pkgbase.tar.gz::https://github.com/googlefonts/noto-emoji/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('e6396642172e3d5031bef5f381cc047a007588e73b26209ba1c47b3d1f8faa60')

package() {
  cd noto-emoji-$pkgver
  mkdir -p "$pkgdir"/usr/share/fonts/TTF
  install -m644 fonts/NotoColorEmoji.ttf "$pkgdir"/usr/share/fonts/TTF
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
