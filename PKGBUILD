# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=basu
pkgver=0.2.1
pkgrel=1
pkgdesc="The sd-bus library, extracted from systemd"
url="https://sr.ht/~emersion/basu/"
license=(LGPL-2.1-or-later)
arch=(x86_64 aarch64 riscv64)
depends=(libcap)
makedepends=(gperf libcap meson linux-headers)
source=($pkgname-$pkgver.tar.gz::https://git.sr.ht/~emersion/basu/archive/v$pkgver.tar.gz)
sha512sums=('SKIP')

build() {
  ewe-meson $pkgname-v$pkgver build \
    -Dsystem-bus-address="unix:path=/run/dbus/system_bus_socket" \
    -Ddefault_library=both \
    -Daudit=disabled
  meson compile -C build
}

check() {
  meson test --no-rebuild -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
