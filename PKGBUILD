# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-desktop-portal-wlr
pkgver=0.8.0
pkgrel=1
pkgdesc='xdg-desktop-portal backend for wlroots'
url="https://github.com/emersion/xdg-desktop-portal-wlr"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('MIT')
provides=('xdg-desktop-portal-impl')
depends=(
    'basu'
    'libdrm'
    'libinih'
    'libpipewire'
    'mesa'
    'pipewire'
    'pipewire-session-manager'
    'wayland'
    'xdg-desktop-portal'
)
makedepends=(
    'linux-headers'
    'meson'
    'scdoc'
    'wayland-protocols'
)
optdepends=(
    'bemenu: to choose which output to screencast using bemenu'
    'slurp: to choose which output to screencast using slurp'
    'wofi: to choose which output to screencast using wofi'
)
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz"
        "wlr-portals.conf")
sha512sums=('41bcfda0a9fc7817201ac0fee04aa0050e0defe9e6108795cee2e279b84d8c63237889150d6cb539d929d93e032fc416fcfe90ff87813ef45bfc2611937fc2b0'
            '72980b5c3c893237b89e42a0ee7ad2c438f25ab9a044718e3748ad49746cac4d8deea24c1408718dd4d2566fcfe6d15eaee2620a73d63c6eb54b0d5c65701cbb')

build() {
    cd "$pkgname-$pkgver"
    ewe-meson -Dsd-bus-provider=basu -Dsystemd=disabled build
    ninja -C build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" ninja -C build install
    _install_license_ LICENSE

    # fix detection with x-d-p 1.18
    install -vDm644 -t "$pkgdir/usr/share/xdg-desktop-portal" "$srcdir/wlr-portals.conf"
}
