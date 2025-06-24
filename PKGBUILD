# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libnghttp2
pkgver=1.66.0
pkgrel=1
pkgdesc='Framing layer of HTTP/2 is implemented as a reusable C library'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://nghttp2.org/'
license=('MIT')
makedepends=('git')
source=(
  "$pkgname::git+https://github.com/nghttp2/nghttp2.git#tag=v${pkgver}"
  'git+https://github.com/ngtcp2/munit.git'
  'git+https://github.com/mruby/mruby.git'
  'git+https://github.com/tatsuhiro-t/neverbleed.git'
)
provides=('libnghttp2')
sha256sums=('948073545a0cf182e3bd637d3d899e4bd50ae197f28d1574b74b7bc1f13c60a8'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd $pkgname

  git config --file=.gitmodules submodule.tests/munit.url ../munit/
  git config --file=.gitmodules submodule.third-party/mruby.url ../mruby/
  git config --file=.gitmodules submodule.tests/neverbleed.url ../neverbleed/

  git submodule init
  git -c protocol.file.allow=always submodule update

  autoreconf -i
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --disable-examples \
    --enable-lib-only
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname/lib

  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/libnghttp2/COPYING"
}
