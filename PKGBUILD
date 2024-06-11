# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=fribidi
pkgver=1.0.15
pkgrel=1
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm"
url="https://github.com/fribidi/fribidi/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
depends=(musl)
makedepends=(meson)
provides=(libfribidi.so)
source=("$url/releases/download/v$pkgver/$pkgname-${pkgver}.tar.xz")
sha256sums=('0bbc7ff633bfa208ae32d7e369cf5a7d20d5d2557a0b067c9aa98bcbf9967587')

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
