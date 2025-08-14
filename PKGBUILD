# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=(
  'ttf-nerd-fonts-symbols'
  'ttf-nerd-fonts-symbols-mono'
  'ttf-nerd-fonts-symbols-common'
)
pkgbase=font-nerd-symbols
pkgver=3.4.0
pkgrel=1
pkgdesc="High number of extra glyphs from popular 'iconic fonts'"
arch=('any')
url=https://github.com/ryanoasis/nerd-fonts
license=('MIT')
source=(
  "SymbolsNerdFont-Regular-$pkgver.ttf::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/patched-fonts/NerdFontsSymbolsOnly/SymbolsNerdFont-Regular.ttf"
  "SymbolsNerdFontMono-Regular-$pkgver.ttf::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/patched-fonts/NerdFontsSymbolsOnly/SymbolsNerdFontMono-Regular.ttf"
  "10-nerd-font-symbols-$pkgver.conf::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/10-nerd-font-symbols.conf"
  "Nerd_Fonts-$pkgver-LICENSE::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/LICENSE"
)
sha256sums=('71db104aa66567d0efe0b98758f9dfc1895573a453fe85fb53d1c38544a55106'
            'f0f624d9b474bea1662cf7e862d44aebe1ae1f6c7f9cb7a0ca5d0e5ac9561c60'
            '83b70b7f706aced1dced5d0aec67e0b6ef7a7fee9fcb37135717eb7687868cd3'
            '1f6ad4edae6479aaace3112ede5279a23284ae54b2a34db66357aef5f64df160')

_package() {
  groups=('nerd-fonts')
  depends=('ttf-nerd-fonts-symbols-common')
  provides=('ttf-font-nerd')

  install -d "$pkgdir"/usr/share/licenses/"$1"
  ln -s /usr/share/licenses/ttf-nerd-fonts-symbols-common/LICENSE \
    "$pkgdir"/usr/share/licenses/"$1"/LICENSE

  case "$1" in
    ttf-nerd-fonts-symbols)
      conflicts=(ttf-nerd-fonts-symbols-{1000,2048}-em)
      replaces=(ttf-nerd-fonts-symbols-{1000,2048}-em)

      install -Dm644 SymbolsNerdFont-Regular-$pkgver.ttf \
        "$pkgdir/usr/share/fonts/TTF/SymbolsNerdFont-Regular.ttf"
      ;;
    ttf-nerd-fonts-symbols-mono)
      pkgdesc+=' (monospace)'
      conflicts=(ttf-nerd-fonts-symbols-{1000,2048}-em-mono)
      replaces=(ttf-nerd-fonts-symbols-{1000,2048}-em-mono)

      install -Dm644 SymbolsNerdFontMono-Regular-$pkgver.ttf \
        "$pkgdir/usr/share/fonts/TTF/SymbolsNerdFontMono-Regular.ttf"
      ;;
  esac
}

package_ttf-nerd-fonts-symbols-common() {
  pkgdesc+=' (common files)'
  install -Dm644 10-nerd-font-symbols-$pkgver.conf \
    "$pkgdir"/usr/share/fontconfig/conf.avail/10-nerd-font-symbols.conf
  install -Dm644 Nerd_Fonts-$pkgver-LICENSE \
    "$pkgdir"/usr/share/licenses/ttf-nerd-fonts-symbols-common/LICENSE
}

for _pkgname in "${pkgname[@]/*-common}"; do
  eval "package_$_pkgname() { _package $_pkgname; }"
done
