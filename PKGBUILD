# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fontconfig
pkgver=2.18.1
pkgrel=1
pkgdesc="Library for configuring and customizing font access"
url=https://www.freedesktop.org/wiki/Software/fontconfig/
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(expat freetype2 musl)
backup=(etc/fonts/fonts.conf)
provides=(libfontconfig.so)
makedepends=(gperf meson symlinks)
source=("https://gitlab.freedesktop.org/fontconfig/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        fontconfig.hook)
install=fontconfig.install
sha256sums=('e9309564717b6301230112b173f36c288489479d381d2f0add1210ca5b16ba7e'
            'fd7b6ce8ce178107f2e0b52462ebf186b6051c6eec945770107fda57048c9f34')

prepare() {
  _patch_ ${pkgname}-${pkgver}
}

build() {
  ewe-meson ${pkgname}-${pkgver} build \
    -D doc=disabled
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $srcdir/*.hook -t "$pkgdir/usr/share/libalpm/hooks"
  _install_license_ $pkgname-$pkgver/COPYING
}
