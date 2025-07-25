# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fontconfig
pkgver=2.17.1
pkgrel=1
pkgdesc="Library for configuring and customizing font access"
url=https://www.freedesktop.org/wiki/Software/fontconfig/
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(expat freetype2 musl)
backup=(etc/fonts/fonts.conf)
provides=(libfontconfig.so)
makedepends=(gperf meson symlinks)
# 0001: Backport, fix testsuite build on musl-libc
#	https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/75cc3e6ef0e451f42d3464ed4d639304ad9a4f58
source=("https://gitlab.freedesktop.org/fontconfig/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
	0001-test-Fix-a-build-issue-with-musl-libc.patch)
install=fontconfig.install
sha256sums=('82e73b26adad651b236e5f5d4b3074daf8ff0910188808496326bd3449e5261d'
            '50b53120a457e118fd6778274ac2afaca61ef2ccb81046be8a8cc2d229135bfb')

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
  _install_license_ $pkgname-$pkgver/COPYING
}
