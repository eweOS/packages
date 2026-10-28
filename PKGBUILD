# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=waylyrics
pkgver=0.4.7
pkgrel=1
pkgdesc="the furry way to show desktop lyrics"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://waylyrics.github.io/waylyrics/waylyrics/"
license=("MIT")
depends=(
    "openssl" "dbus" "glib2" "cairo" "dconf" "gtk4" "gettext"
    "opencc"
)
makedepends=(
    "rust"
)
# 0001: Downstream, eweOS gtk4 is built without the X11 backend, so gtk4-x11.pc is unavailable
# TODO: It should be upstreamed! Make the X11 skip-taskbar support optional.
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/waylyrics/waylyrics/archive/refs/tags/v$pkgver.tar.gz"
    "0001-make-x11-skip-taskbar-optional.patch"
)
options=(!lto)
sha256sums=('c3dee33d2d2ff73b4b01de7f1add74b978ad559e85f24f2cb8dc216016539ac5'
            '51852273941545d1ffa112f177cb6cd18eac2aa1f9c4de04fd8e5433d90aba92')
optdepends=('xdg-desktop-portal: file dialog to import LRC')

_features='mimalloc tray-icon i18n import-lyric i18n-local-lyric'

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    _patch_ "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
build() {
    cd "$srcdir/$pkgname-$pkgver"
    export WAYLYRICS_THEME_PRESETS_DIR="/usr/share/$pkgname/themes"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --all-targets --no-default-features --features="${_features}"
}
check() {
    cd "$srcdir/$pkgname-$pkgver"
    export WAYLYRICS_THEME_PRESETS_DIR="/usr/share/$pkgname/themes"
    export RUSTUP_TOOLCHAIN=stable
    # LRCLib's public API intermittently returns 503 ServerOverloaded.
    # Use the upstream offline-test feature to skip network-dependent tests.
    cargo test --release --frozen --no-default-features --features="${_features} offline-test"
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
    _install_license_ LICENSE
}
