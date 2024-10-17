# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=(
  'ttf-nerd-fonts-symbols'
  'ttf-nerd-fonts-symbols-mono'
  'ttf-nerd-fonts-symbols-common'
)
pkgbase=font-nerd-symbols
pkgver=3.2.1
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
sha256sums=('4bc091384cbc8d12b333fb1fcecce8b4701149dbce1f1271ab74374abb7ba906'
            '6f7e339af33bde250a4d7360a3176ab1ffe4e99c00eef0d71b4c322364c595f3'
            '6601e431c5c43d80dfce375147b297df0b36bb4d465948f8f2178c1da89ace76'
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
