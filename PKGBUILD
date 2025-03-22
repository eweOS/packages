# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=font-noto-emoji
pkgname=ttf-noto-fonts-emoji
pkgver=2.047
pkgrel=1
pkgdesc='Google Noto emoji fonts'
arch=(any)
url='https://www.google.com/get/noto/'
license=(custom:OFL)
provides=(emoji-font)
makedepends=(git)
source=($pkgbase.tar.gz::https://github.com/googlefonts/noto-emoji/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('2cfaf5a427eb26334cdb30d98e4a0c005b660504a339249dc54373e566f09b50')

package() {
  cd noto-emoji-$pkgver
  mkdir -p "$pkgdir"/usr/share/fonts/noto
  install -m644 fonts/NotoColorEmoji.ttf "$pkgdir"/usr/share/fonts/noto
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
