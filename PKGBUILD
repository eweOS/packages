# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=enlightenment
pkgver=0.28.0
pkgrel=1
pkgdesc="Enlightenment window manager"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="http://www.enlightenment.org"
license=('BSD-2-Clause')
depends=('alsa-lib' 'efl' 'hicolor-icon-theme' 'libexif' 'librsvg' 'libpulse'
         'libxkbcommon' 'pam' 'util-linux-libs'
         'wayland' 'wayland-protocols')
optdepends=('acpid: power events on laptop lid close'
            'bluez: Bluetooth control module'
            'connman: network connection manager module'
            'networkmanager: network connection manager module'
            'fprintd: fingerprint password settings'
            'geoclue: geolocation module'
            'packagekit: package manager integration module')
makedepends=('meson' 'ninja' 'git')
backup=('etc/enlightenment/sysactions.conf'
        'etc/enlightenment/system.conf'
        'etc/xdg/menus/e-applications.menu')
# 0001: Downstream, guard the X11-only fatal I/O handler for the Wayland-only build
# TODO: should be upstreamed
# 0002: Downstream, use loop time instead of the X11 timestamp in networkmanager
# TODO: should be upstreamed
# 0003: Downstream, guard the X11 client hash cleanup
# TODO: should be upstreamed
source=("https://download.enlightenment.org/rel/apps/${pkgname}/$pkgname-$pkgver.tar.xz"
        "0001-guard-x11-only-fatal-handler.patch"
        "0002-networkmanager-wayland-activate-time.patch"
        "0003-client-guard-x11-hash-clear.patch")
sha256sums=('8ab2d8a76c4009d142561f5136048b969796f4a79df8af6018713d1d163a5c6b'
            '0d9f5f6946ab10c8fcb6da84de6230d49ac4d3d04882aec5f88c011403915a94'
            '66da43a721d7fdd14fd21ac68b6e6daaba36942ddc39590f3b0aab076ae4e2a9'
            'e41aaa569c7732cad6d876f230d44ab7ddef290c3ee608b0f38f4533e9095375')

prepare() {
  _patch_ ${pkgname}-${pkgver}
}

build() {
  CFLAGS+=' -fvisibility=hidden'

  ewe-meson ${pkgname}-${pkgver} build \
    -Dwl=true \
    -Dwl-x11=false \
    -Dxwayland=false \
    -Dsystemd=false \
    -Dconvertible=false
  meson compile -C build
}

package() {
  depends+=('font-base')
  meson install -C build --destdir "$pkgdir"

  # install LICENSE
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
