# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=font-fira-code
pkgname=(
  ttf-fira-code
  ttf-fira-code-variable
)
pkgver=6.2
pkgrel=3
pkgdesc="Monospaced font with programming ligatures"
arch=('any')
url='https://github.com/tonsky/FiraCode'
license=('custom:OFL')
source=("$pkgbase-$pkgver.zip::https://github.com/tonsky/FiraCode/releases/download/${pkgver}/Fira_Code_v${pkgver}.zip"
        "LICENSE::https://raw.githubusercontent.com/tonsky/FiraCode/${pkgver}/LICENSE")
sha512sums=('7f71b34cce960bb5b90165505214d9effa7aa0b9e3ae3a7da37b900db54adbb30d1ff4b44f77c88fe0c7ddef45fc17ac6f05f08745fd26e1a298eeb61e6fddd3'
            'bee6615aa2c8771ea9685a6de630eceb554c22920fd56379be460f461b27081de2d12e04298e4aecc76b733465730f3f3b602867abbc2df53105eb8ccf5475d2')
            
package_ttf-fira-code() {
    provides=(font-fira-code)
    cd ttf

    install -dm755 "$pkgdir/usr/share/fonts/TTF"

    # Install fonts
    local fonts=(FiraCode*.ttf)
    local font
    for font in "${fonts[@]}"; do
        install -vm644 "$font" "$pkgdir/usr/share/fonts/TTF"
    done

    # Install LICENSE
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-fira-code-variable() {
    provides=(font-fira-code)
    pkgdesc+=" - variable font"
    provides=(ttf-fira-code)
    conflicts=(ttf-fira-code)

    cd variable_ttf

    install -dm755 "$pkgdir/usr/share/fonts/TTF"

    # Install fonts
    local fonts=(FiraCode*.ttf)
    local font
    for font in "${fonts[@]}"; do
        install -vm644 "$font" "$pkgdir/usr/share/fonts/TTF"
    done

    # Install LICENSE
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
