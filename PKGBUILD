# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fontconfig
pkgver=2.16.1
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
sha256sums=('570e70cc481b871683dec38040d6a40a08068c685277cae9ad7ec5a717040203')

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
