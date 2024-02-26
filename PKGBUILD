# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gettext
pkgver=0.22.5
pkgrel=1
pkgdesc="GNU internationalization library"
arch=(x86_64 aarch64 riscv64)
license=(GPL3)
groups=(base-devel)
depends=(acl)
makedepends=(gettext)
options=(!docs !buildflags)
source=(https://mirrors.ustc.edu.cn/gnu/gettext/$pkgname-$pkgver.tar.gz)
sha256sums=('ec1705b1e969b83a9f073144ec806151db88127f5e40fe5a94cb6c8fa48996a0')

build()
{
  cd $pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --enable-csharp \
    --enable-nls \
    --with-xz \
    --without-included-gettext

  make
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
