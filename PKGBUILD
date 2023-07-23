# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=fribidi
pkgver=1.0.13
pkgrel=1
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm"
url="https://github.com/fribidi/fribidi/"
arch=(x86_64 aarch64)
license=(LGPL)
depends=(musl)
makedepends=(meson)
provides=(libfribidi.so)
source=("$url/releases/download/v$pkgver/$pkgname-${pkgver}.tar.xz")
sha256sums=('7fa16c80c81bd622f7b198d31356da139cc318a63fc7761217af4130903f54a2')

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
