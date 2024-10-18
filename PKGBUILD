# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=fribidi
pkgver=1.0.16
pkgrel=2
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm"
url="https://github.com/fribidi/fribidi/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL)
depends=(musl)
makedepends=(meson)
provides=(libfribidi.so)
source=("$url/releases/download/v$pkgver/$pkgname-${pkgver}.tar.xz")
sha256sums=('1b1cde5b235d40479e91be2f0e88a309e3214c8ab470ec8a2744d82a5a9ea05c')

build()
{
  ewe-meson $pkgname-$pkgver build \
    -D docs=false
  meson compile -C build
}

check()
{
  meson test -C build --print-errorlogs
}

package()
{
  meson install -C build --destdir "$pkgdir"
}
