# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ebook-tools
pkgver=0.2.2
pkgrel=2
pkgdesc='Tools for accessing and converting various ebook file formats'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://sourceforge.net/projects/ebook-tools/'
license=(MIT)
depends=(convertlit
         libxml2
         libzip
         sh)
makedepends=(cmake)
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        crash-fix.patch)
sha256sums=('cbc35996e911144fa62925366ad6a6212d6af2588f1e39075954973bbee627ae'
            '3beeb486732b9caa4491c337ad123a82cc09099a75320788d47f5a7e7dfa622b')

prepare() {
  cd $pkgname-$pkgver
  patch -p2 -i ../crash-fix.patch # https://sourceforge.net/p/ebook-tools/bugs/8/
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

