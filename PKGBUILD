# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Thomas Mader <thezema@gmail.com>
# Contributor: Vinay S Shastry <vinayshastry@gmail.com>
# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=astyle
pkgver=3.4.14
_sover=3.2.0
pkgrel=1
pkgdesc='A free, fast and small automatic formatter for C, C++, C#, and Java source code.'
arch=(x86_64 aarch64 riscv64)
url='http://astyle.sourceforge.net/'
license=('LGPL')
depends=('llvm-libs')
source=("https://downloads.sourceforge.net/sourceforge/astyle/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('606a83f39146733185f6763059d292433c40f393eb6f52042e163f8df4e16a3e')

prepare()
{
  cd "$srcdir/$pkgname-$pkgver/build/clang"
  sed -i 's@--symbolic --force@-s -f@g' Makefile
}

build()
{
  cd "$srcdir/$pkgname-$pkgver/build/clang"
  make CXX=c++ release shared
}

package()
{
  cd "$srcdir/$pkgname-$pkgver/build/clang"

  install -Dm0755 bin/astyle "$pkgdir/usr/bin/astyle"
  install -Dm0755 "bin/libastyle.so.${_sover}" "$pkgdir/usr/lib/libastyle.so.${_sover}"
  ln -s libastyle.so.${_sover} "$pkgdir"/usr/lib/libastyle.so.${_sover%%\.*}
  ln -s libastyle.so.${_sover} "$pkgdir"/usr/lib/libastyle.so

  # install header
  install -Dm0644 ../../src/astyle.h -t "$pkgdir"/usr/include

  # install documentation (implements FS#23290)
  install -d "$pkgdir/usr/share/doc/$pkgname/"
  for f in ../../doc/*.html; do
    install -m0644 "$f" "$pkgdir/usr/share/doc/$pkgname/"
  done
}
