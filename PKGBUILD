# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=font-noto
pkgname=(
    ttf-noto ttf-noto-variable
    ttf-noto-base ttf-noto-base-variable
    ttf-noto-extra ttf-noto-extra-variable
    ttf-noto-extra-static-only
    ttf-noto-sans ttf-noto-serif ttf-noto-sans-mono
    ttf-noto-sans-variable ttf-noto-serif-variable ttf-noto-sans-mono-variable
)
pkgver=2026.08.01
pkgrel=1
pkgdesc='Google Noto TTF fonts'
arch=(any)
url='https://fonts.google.com/noto'
license=(custom:SIL)
makedepends=(git)
options=(!strip)
source=(https://github.com/notofonts/notofonts.github.io/archive/refs/tags/noto-monthly-release-$pkgver.tar.gz
        66-noto-sans.conf 66-noto-serif.conf 66-noto-mono.conf
        46-noto-sans.conf 46-noto-serif.conf 46-noto-mono.conf)
sha256sums=('ef269bd42da0cd1c602c69c9edd81c655662babf495f69cd66d01842a1b7bbb2'
            '52684bebf6447be22618d2a04ff37623ec92f9d8ccf6b6f972e5bcbcfee90d69'
            '4459944b63dc083107280f5d7375c69746bf80a09416a4a4909a100e58e5a33a'
            '4526289f59654e2a81dc734669a1ae4e416f9a56d0896ec3741c6bf065baf8a8'
            '83a8faf6a47954075f97a2d555048e2a6689c38603b2ca00150157bf645f4593'
            'c94368b24506770767d003e5bcba589a8e402e489c240ee52453bf3ac7e9b5fa'
            'f5c09b37280d7569b6c99a78511639be4ae25b8c5406464422fe0421fe13a884')

prepare() {
    cd notofonts.github.io-noto-monthly-release-$pkgver
    for _FONT in $(find fonts -type d -maxdepth 1 -mindepth 1); do
        if [ "$_FONT" != "fonts/NotoSans" ] && [ "$_FONT" != "fonts/NotoSansMono" ] && [ "$_FONT" != "fonts/NotoSerif" ]; then
            if [ -d $_FONT/unhinted/variable-ttf ]; then
                find "$_FONT/unhinted/variable-ttf" -type f -name "*.ttf" >> $srcdir/variable.list
                find "$_FONT/hinted/ttf" -type f -name "*.ttf" >> $srcdir/static-withvariable.list
            else
                find "$_FONT/hinted/ttf" -type f -name "*.ttf" >> $srcdir/static-only.list
            fi
        fi
    done
}

package_ttf-noto() {
    optdepends=('font-noto-cjk: CJK characters'
                'font-noto-emoji: Emoji characters')
    depends=(ttf-noto-base ttf-noto-extra)
    provides=($pkgbase)

    cd notofonts.github.io-noto-monthly-release-$pkgver
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_ttf-noto-variable() {
    pkgdesc+=' - variable'
    optdepends=('font-noto-cjk: CJK characters'
                'font-noto-emoji: Emoji characters')
    depends=(ttf-noto-base-variable ttf-noto-extra-variable)
    provides=($pkgbase ttf-noto)
    conflicts=(ttf-noto)

    cd notofonts.github.io-noto-monthly-release-$pkgver
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_ttf-noto-base() {
    pkgdesc+=' (Base)'
    optdepends=('font-noto-extra: additional characters')
    depends=(ttf-noto-sans ttf-noto-sans-mono ttf-noto-serif)
    provides=(font-base font-noto-base)

    cd notofonts.github.io-noto-monthly-release-$pkgver
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_ttf-noto-base-variable() {
    pkgdesc+=' (Base) - variable'
    optdepends=('font-noto-extra: additional characters')
    depends=(ttf-noto-sans-variable ttf-noto-sans-mono-variable ttf-noto-serif-variable)
    provides=(font-base font-noto-base ttf-noto-base)
    conflicts=(ttf-noto-base)

    cd notofonts.github.io-noto-monthly-release-$pkgver
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_ttf-noto-extra() {
    pkgdesc+=' (Extra)'
    depends=(ttf-noto-extra-static-only)
    provides=(font-noto-extra)

    cd notofonts.github.io-noto-monthly-release-$pkgver

    while read -r _fontpath; do
        install -Dm644 $_fontpath -t "$pkgdir"/usr/share/fonts/TTF
    done < $srcdir/static-withvariable.list

    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_ttf-noto-extra-variable() {
    pkgdesc+=' (Extra) - variable'
    depends=(ttf-noto-extra-static-only)
    provides=(font-noto-extra ttf-noto-extra)
    conflicts=(ttf-noto-extra)

    cd notofonts.github.io-noto-monthly-release-$pkgver

    while read -r _fontpath; do
        install -Dm644 $_fontpath -t "$pkgdir"/usr/share/fonts/TTF
    done < $srcdir/variable.list

    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_ttf-noto-extra-static-only() {
    pkgdesc+=' (static-only fonts)'

    cd notofonts.github.io-noto-monthly-release-$pkgver

    while read -r _fontpath; do
        install -Dm644 $_fontpath -t "$pkgdir"/usr/share/fonts/TTF
    done < $srcdir/static-only.list

    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_ttf-noto-sans() {
    pkgdesc+=' (Sans)'
    provides=(font-noto-sans)

    cd notofonts.github.io-noto-monthly-release-$pkgver

    install -Dm644 fonts/NotoSans/full/ttf/*.ttf -t "$pkgdir"/usr/share/fonts/TTF

    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname

    install -Dm644 $srcdir/*-noto-sans.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail/
    install -d "$pkgdir"/usr/share/fontconfig/conf.default
    cp "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default/
}

package_ttf-noto-sans-variable() {
    pkgdesc+=' (Sans) - variable'
    provides=(font-noto-sans ttf-noto-sans)
    conflicts=(ttf-noto-sans)

    cd notofonts.github.io-noto-monthly-release-$pkgver

    install -Dm644 fonts/NotoSans/full/variable-ttf/*.ttf -t "$pkgdir"/usr/share/fonts/TTF

    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname

    install -Dm644 $srcdir/*-noto-sans.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail/
    install -d "$pkgdir"/usr/share/fontconfig/conf.default
    cp "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default/
}

package_ttf-noto-serif() {
    pkgdesc+=' (Serif)'
    provides=(font-noto-serif)

    cd notofonts.github.io-noto-monthly-release-$pkgver

    install -Dm644 fonts/NotoSerif/hinted/ttf/*.ttf -t "$pkgdir"/usr/share/fonts/TTF

    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname

    install -Dm644 $srcdir/*-noto-serif.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail/
    install -d "$pkgdir"/usr/share/fontconfig/conf.default
    cp "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default/
}

package_ttf-noto-serif-variable() {
    pkgdesc+=' (Serif) - variable'
    provides=(font-noto-serif ttf-noto-serif)
    conflicts=(ttf-noto-serif)

    cd notofonts.github.io-noto-monthly-release-$pkgver

    install -Dm644 fonts/NotoSerif/unhinted/variable-ttf/*.ttf -t "$pkgdir"/usr/share/fonts/TTF

    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname

    install -Dm644 $srcdir/*-noto-serif.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail/
    install -d "$pkgdir"/usr/share/fontconfig/conf.default
    cp "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default/
}

package_ttf-noto-sans-mono() {
    pkgdesc+=' (Sans Mono)'
    provides=(font-noto-sans-mono)

    cd notofonts.github.io-noto-monthly-release-$pkgver

    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname

    install -Dm644 fonts/NotoSansMono/hinted/ttf/*.ttf -t "$pkgdir"/usr/share/fonts/TTF

    install -Dm644 $srcdir/*-noto-mono.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail/
    install -d "$pkgdir"/usr/share/fontconfig/conf.default
    cp "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default/
}

package_ttf-noto-sans-mono-variable() {
    pkgdesc+=' (Sans Mono) - variable'
    provides=(font-noto-sans-mono ttf-noto-sans-mono)
    conflicts=(ttf-noto-sans-mono)

    cd notofonts.github.io-noto-monthly-release-$pkgver

    install -Dm644 fonts/NotoSansMono/unhinted/variable-ttf/*.ttf -t "$pkgdir"/usr/share/fonts/TTF

    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname

    install -Dm644 $srcdir/*-noto-mono.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail/
    install -d "$pkgdir"/usr/share/fontconfig/conf.default
    cp "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default/
}
