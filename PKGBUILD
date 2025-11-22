# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=font-noto-emoji
pkgname=ttf-noto-fonts-emoji
pkgver=2.051
pkgrel=1
pkgdesc='Google Noto emoji fonts'
arch=(any)
url='https://www.google.com/get/noto/'
license=(custom:OFL)
provides=(font-emoji)
makedepends=(git)
source=($pkgbase.tar.gz::https://github.com/googlefonts/noto-emoji/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('04f3d1e5605edebebac00a7a0becb390a4a3ead015066905b27935b30c18e745')

package() {
  cd noto-emoji-$pkgver
  mkdir -p "$pkgdir"/usr/share/fonts/TTF
  install -m644 fonts/NotoColorEmoji.ttf "$pkgdir"/usr/share/fonts/TTF
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
