# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fontconfig
pkgver=2.18.0
pkgrel=2
pkgdesc="Library for configuring and customizing font access"
url=https://www.freedesktop.org/wiki/Software/fontconfig/
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(expat freetype2 musl)
backup=(etc/fonts/fonts.conf)
provides=(libfontconfig.so)
makedepends=(gperf meson symlinks)
# 0001: Backport, 80191ec6a13e ("Fix a null pointer dereference when computing a pattern from an FT_Face that has no family ")
#	fix libfontconfig.so related crashes when the font has no family, for
#       example, Unifont. Without this patch, fc-match also fails to match
#       Unifont in any way.
source=("https://gitlab.freedesktop.org/fontconfig/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        0001-Fix-a-null-pointer-dereference-when-computing.patch
        fontconfig.hook)
install=fontconfig.install
sha256sums=('5c94af4828988af6b1a8484ddba13b521162687f9e5129bd8f267b8f4cfbf619'
            '59193f4f307df25c5815985cde11a777bd8772cce2a7dcf15f41fb84ce10629f'
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
