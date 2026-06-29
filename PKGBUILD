# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-desktop-portal-wlr
pkgver=0.8.3
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
sha512sums=('58b168df29f60b981830aba1663a3e4a1f482d0635e5eff12e212b24a259f2acd4547feb5a17ba1ce3364125817351b5d6849f8fc62401e06ed901fd59a42e16'
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
