# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=oniguruma
pkgver=6.9.9
pkgrel=1
pkgdesc="a regular expressions library"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/kkos/oniguruma"
license=('BSD')
source=("https://github.com/kkos/oniguruma/releases/download/v$pkgver/onig-${pkgver/_/-}.tar.gz")
sha256sums=('60162bd3b9fc6f4886d4c7a07925ffd374167732f55dce8c491bfd9cd818a6cf')

build()
{
  cd "$srcdir"/onig-${pkgver%.1}
  ./configure --prefix=/usr --enable-posix-api
  make
}

check()
{
  cd "$srcdir"/onig-${pkgver%.1}
  make check
}

package()
{
  cd "$srcdir"/onig-${pkgver%.1}
  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir"/usr/share/doc
  cp -r doc "$pkgdir"/usr/share/doc/$pkgname
  for licfile in COPYING INSTALL; do
    install -Dm644 $licfile "$pkgdir"/usr/share/licenses/$pkgname/$licfile
  done
}
