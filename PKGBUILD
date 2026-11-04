# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=fribidi
pkgver=1.0.18
pkgrel=1
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm"
url="https://github.com/fribidi/fribidi/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL)
depends=(musl)
makedepends=(meson)
provides=(libfribidi.so)
source=("$url/releases/download/v$pkgver/$pkgname-${pkgver}.tar.xz")
sha256sums=('1de5e8073d035388b71d0b2d452b1da1f8caeea8a7702997b401fe1b6250727f')

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
