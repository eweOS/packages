# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=waylyrics
pkgver=0.3.13
pkgrel=1
pkgdesc="the furry way to show desktop lyrics"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://waylyrics.github.io/waylyrics/waylyrics/"
license=("MIT")
depends=(
    "openssl" "dbus" "glib2" "cairo" "dconf" "gtk4" "gettext"
    "opencc"
)
makedepends=(
    "rust"
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/waylyrics/waylyrics/archive/refs/tags/v$pkgver.tar.gz"
)
options=(!lto)
sha256sums=('a4145c0a068564e9b69830f14e3e22234462eb2308d79eba232e92395af0747d')
optdepends=('xdg-desktop-portal: file dialog to import LRC')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
build() {
    cd "$srcdir/$pkgname-$pkgver"
    export WAYLYRICS_THEME_PRESETS_DIR="/usr/share/$pkgname/themes"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --all-targets --all-features
}
check() {
    cd "$srcdir/$pkgname-$pkgver"
    export WAYLYRICS_THEME_PRESETS_DIR="/usr/share/$pkgname/themes"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen --all-features
}
package() {
    depends+=("hicolor-icon-theme")
    local _id=io.github.waylyrics.Waylyrics
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 metainfo/$_id.desktop \
        "$pkgdir/usr/share/applications/$_id.desktop"
    install -Dm644 metainfo/$_id.gschema.xml \
        "$pkgdir/usr/share/glib-2.0/schemas/$_id.gschema.xml"
    install -Dm644 metainfo/$_id.metainfo.xml \
        "$pkgdir/usr/share/metainfo/$_id.metainfo.xml"
    local theme locale
    for theme in themes/*.css
    do
        echo "Installing theme $theme..."
        install -Dm644 "$theme" "$pkgdir/usr/share/$pkgname/$theme"
    done
    for locale in locales/*/LC_MESSAGES/waylyrics.po
    do
        echo "Installing locale $locale..."
        mo=${locale/#locales\/} # */LC_MESSAGES/waylyrics.po
        mo=${mo/%.po/.mo} # */LC_MESSAGES/waylyrics.mo
        msgfmt "$locale" -o - | install -Dm644 /dev/stdin \
            "$pkgdir/usr/share/locale/$mo"
    done
    install -Dm644 res/icons/hicolor/scalable/apps/$_id.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_id.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
