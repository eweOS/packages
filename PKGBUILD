# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=libutf8proc
pkgver=2.7.0
_sover=2.5.0
pkgrel=2
pkgdesc='C library for processing UTF-8 encoded Unicode strings'
arch=(x86_64 aarch64)
url='https://github.com/JuliaStrings/utf8proc'
license=(custom)
makedepends=(cmake git ninja)
source=("git+$url#tag=v$pkgver"
  libutf8proc.pc.in)
sha256sums=('SKIP'
  'SKIP')

prepare()
{
  sed "s#@VERSION@#$pkgver#" libutf8proc.pc.in > libutf8proc.pc
}

build()
{
  cmake -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_LIBDIR=lib \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D BUILD_SHARED_LIBS=ON \
    -G Ninja \
    -S utf8proc
  ninja -C build
}

package()
{
  # The install command does not work for libutf8proc
  #DESTDIR="$pkgdir" ninja -C $pkgname-$pkgver/build install

  cd utf8proc
  install -Dm644 utf8proc.h "$pkgdir/usr/include/utf8proc.h"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 "$srcdir/libutf8proc.pc" \
    "$pkgdir/usr/lib/pkgconfig/libutf8proc.pc"
  install -Dm644 ../build/libutf8proc.so.$_sover \
    "$pkgdir/usr/lib/libutf8proc.so.$_sover"
  ln -s libutf8proc.so.$_sover "$pkgdir/usr/lib/libutf8proc.so"
  #ldconfig -n "$pkgdir/usr/lib"
}
