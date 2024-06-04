# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libtheora
pkgver=1.1.1
pkgrel=1
pkgdesc='Standard encoder and decoder library for the Theora video compression format'
arch=(x86_64 aarch64 riscv64)
url='https://www.theora.org/'
license=('BSD-3-Clause')
depends=('libogg')
makedepends=('git' 'libpng' 'libvorbis' 'sdl1')
source=("git+https://github.com/xiph/theora.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd theora

  # Fix for autoreconf
  git cherry-pick -n 28cc6dbd9b2a141df94f60993256a5fca368fa54

  # Fix build with libpng 1.6
  git cherry-pick -n 7288b539c52e99168488dc3a343845c9365617c8

  autoreconf -fi
}

build() {
  cd theora
  ./configure --prefix=/usr
  make
}

check() {
  cd theora
  make check
}

package() {
  cd theora
  make DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE COPYING
}
