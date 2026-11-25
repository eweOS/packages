# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=astyle
pkgver=3.6.28
_sover=$pkgver
pkgrel=1
pkgdesc='A free, fast and small automatic formatter for C, C++, C#, and Java source code.'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='http://astyle.sourceforge.net/'
license=('MIT')
depends=('llvm-libs')
source=("https://downloads.sourceforge.net/sourceforge/astyle/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('816bbd1e3c41b0dc606ae10fdd5492253030fc5506903d61f3575bff9178b7d4')

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

  _install_license_ "$srcdir/$pkgname-$pkgver/LICENSE.md"
}
