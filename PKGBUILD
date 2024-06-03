# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libvpx
pkgver=1.14.1
pkgrel=1
pkgdesc='Library for the vp8/vp9 codecs'
url='https://www.webmproject.org/'
arch=(x86_64 aarch64 riscv64)
license=(BSD)
depends=(musl)
options=(!lto)
makedepends=(perl nasm)
source=(
  "https://github.com/webmproject/libvpx/archive/v$pkgver/libvpx-v$pkgver.tar.gz"
  do-not-check-diff.patch
)
provides=('libvpx.so')

prepare () {
  _patch_ libvpx-$pkgver
}

build () {
  cd libvpx-$pkgver
  export CC=clang
  export LD=clang
  ./configure	\
    --prefix=/usr				\
    --enable-postproc			\
    --enable-vp9-postproc			\
    --enable-vp8				\
    --enable-vp9				\
    --enable-vp9-highbitdepth		\
    --enable-shared
	
  make
}

package() {
  cd libvpx-$pkgver
  make install DESTDIR=$pkgdir
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/libvpx/LICENSE
}

sha256sums=('901747254d80a7937c933d03bd7c5d41e8e6c883e0665fadcb172542167c7977'
            'eeb29a0d795a5f05868017feec1d4155209ff5a87967f7d3992ef2044e5d7b0d')
