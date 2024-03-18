# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=duktape
pkgver=2.7.0
pkgrel=1
pkgdesc='Embeddable Javascript engine'
url='https://duktape.org/'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
provides=(libduktape{,d}.so)
source=("https://duktape.org/duktape-$pkgver.tar.xz")
sha256sums=('90f8d2fa8b5567c6899830ddef2c03f3c27960b11aca222fa17aa7ac613c2890')

prepare() {
  cd duktape-$pkgver

  # tools/configure.py needs Python 2
  sed -i 's/^#undef DUK_USE_FASTINT$/#define DUK_USE_FASTINT/' src/duk_config.h

  # Add missing NEEDED on libm.so
  sed -i 's/duktape\.c/& -lm/' Makefile.sharedlibrary
}

_make() (
  local make_options=(
    -f Makefile.sharedlibrary
    INSTALL_PREFIX=/usr
  )

  make "${make_options[@]}" "$@"
)

build() {
  cd duktape-$pkgver
  _make
}

package() {
  cd duktape-$pkgver
  _make DESTDIR="$pkgdir" install
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE.txt
}
