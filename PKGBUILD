# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=fribidi
pkgver=1.0.14
pkgrel=1
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm"
url="https://github.com/fribidi/fribidi/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
depends=(musl)
makedepends=(meson)
provides=(libfribidi.so)
source=("$url/releases/download/v$pkgver/$pkgname-${pkgver}.tar.xz")
sha256sums=('76ae204a7027652ac3981b9fa5817c083ba23114340284c58e756b259cd2259a')

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
