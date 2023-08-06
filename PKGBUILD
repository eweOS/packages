# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fbterm
pkgver=1.7
pkgrel=1
pkgdesc='Framebuffer terminal emulator'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/izmntuk/fbterm'
license=('GPL2')
depends=(freetype2 fontconfig ncurses)
makedepends=(autoconf patch)
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
    '0001-Fix-build-with-gcc-6.patch' 'fix_ftbfs_crosscompile.patch'
    'fbconfig.patch' 'color_palette.patch' 'fbterm.patch' 'fix-musl.patch' 
    'fix-musl-cpp.patch'
    'fbtermrc')
sha256sums=('68e9742b23d6f143d809a5930f5f22c7e55d7c14a4ab2c8a842e0b5c27b1f863'
            '8054410ab97da3df03406543c6a471acf3323b9e5712da6455d7c49cad7489ce'
            '73f0c87aaa5a74631c167fb765c0340dc28626b00d0a3cd065cebf71acc585f7'
            '0d1781e2654d32d5dfd1cbf17680b49aefbb124b7164ca1d70fcf4468563be7c'
            'ad865628f2f6d67c82a5d29b1ec68af37293b9df5f4a6e8fad6b356d08ab368b'
            '5cd1c14c640679a40f8a9d9781c2a5af5db7543c2296cda99f2886aa40468735'
            'e64ac4247566f1bbeff5bfe7ba4a1ad13ecaffc790c405303078bc97620c5324'
            'd1a82df6a606b0f070b9c85160ea81db357e8c951c99f6abec7ed4cf4924a373'
            'ccd21f8b66631067393cb74e222aca1935c449be569b95c1008d6c7c76b7d4b6')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  patch -p1 < "$srcdir/fbconfig.patch"
  patch -p1 < "$srcdir/color_palette.patch"
  patch -p1 < "$srcdir/fbterm.patch"
  patch -p1 < "$srcdir/0001-Fix-build-with-gcc-6.patch"
  patch -p1 < "$srcdir/fix_ftbfs_crosscompile.patch"
  patch -p1 < "$srcdir/fix-musl.patch"
  patch -p1 < "$srcdir/fix-musl-cpp.patch"

  autoreconf -fvi
  ./configure --prefix=/usr
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
  mkdir -p tic
  TERMINFO=$srcdir/$pkgname-$pkgver/tic tic terminfo/fbterm
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install

  mkdir -p "$pkgdir/usr/share/terminfo"
  cp -r tic/f "$pkgdir/usr/share/terminfo/"

  mkdir -p "$pkgdir/etc/fbterm"
  cp $srcdir/fbtermrc "$pkgdir/etc/fbterm/fbtermrc.example"
}

