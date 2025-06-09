
# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libvpx
pkgver=1.15.2
pkgrel=1
pkgdesc='Library for the vp8/vp9 codecs'
url='https://www.webmproject.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
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
  ./configure \
    --prefix=/usr \
    --enable-postproc \
    --enable-vp9-postproc \
    --enable-vp8 \
    --enable-vp9 \
    --enable-vp9-highbitdepth \
    --disable-lsx \
    --disable-lasx \
    --enable-shared

  make
}

package() {
  cd libvpx-$pkgver
  make install DESTDIR=$pkgdir
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/libvpx/LICENSE
}

sha256sums=('26fcd3db88045dee380e581862a6ef106f49b74b6396ee95c2993a260b4636aa'
            'eeb29a0d795a5f05868017feec1d4155209ff5a87967f7d3992ef2044e5d7b0d')
