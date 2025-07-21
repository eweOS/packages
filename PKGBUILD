# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fontconfig
pkgver=2.17.1
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
sha256sums=('82e73b26adad651b236e5f5d4b3074daf8ff0910188808496326bd3449e5261d')

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
