# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fontconfig
pkgver=2.18.0
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
sha256sums=('5c94af4828988af6b1a8484ddba13b521162687f9e5129bd8f267b8f4cfbf619'
            'fd7b6ce8ce178107f2e0b52462ebf186b6051c6eec945770107fda57048c9f34')

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
