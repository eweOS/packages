# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fontconfig
pkgver=2.16.2
pkgrel=1
pkgdesc="Library for configuring and customizing font access"
url=https://www.freedesktop.org/wiki/Software/fontconfig/
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(custom)
depends=(expat freetype2 gperf)
backup=(etc/fonts/fonts.conf)
provides=(libfontconfig.so)
makedepends=(meson symlinks)
source=(
  "https://gitlab.freedesktop.org/fontconfig/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
install=fontconfig.install
sha256sums=('8b9368ae99d9faf2fe26491645fbeebf0272d911cacc5d3e9cf954c2157c151e')

build()
{
  ewe-meson ${pkgname}-${pkgver} build \
    -D doc=disabled
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package()
{
  meson install -C build --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 ${pkgname}-${pkgver}/COPYING
  _install_license_ $pkgname-$pkgver/COPYING
}
