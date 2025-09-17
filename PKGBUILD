# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=discount
pkgver=3.0.1
_pkgver=3.0.0d
pkgrel=1
pkgdesc='A Markdown implementation written in C'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.pell.portland.or.us/~orc/Code/discount/'
license=(BSD-3-Clause)
source=(https://github.com/Orc/discount/archive/v$_pkgver/$pkgname-$pkgver.tar.gz fix-rep-c.patch)
sha256sums=('0ed8cc27ac5d46dc6a8beedd5e5673ac8b466a6474bdb7d35f37c815f670385f'
            'eda8d9204503f1acb6ec4b9ea879239ccdda72f8cb79778e1c65300dee56f74e')

prepare() {
  _patch_ $pkgname-$_pkgver
}

build() {
  cd $pkgname-$_pkgver
  ./configure.sh \
    --prefix=/usr \
    --enable-all-features \
    --with-fenced-code \
    --shared
  make
}

package() {
  cd $pkgname-$_pkgver
  make DESTDIR="$pkgdir" install.everything
  install -Dm644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
