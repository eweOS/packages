# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=speex
pkgver=1.2.1
pkgrel=1
pkgdesc="A free codec for free speech"
url="https://www.speex.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD)
depends=(libogg speexdsp)
makedepends=(git)
source=("git+https://gitlab.xiph.org/xiph/speex.git#tag=Speex-$pkgver")
sha256sums=('b25b34407411a210ccfe4f51f1cf5022d11fd5d9cdc769d23f0881411dfa66d8')

prepare() {
  cd speex
  ./autogen.sh
}

build() {
  cd speex
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --enable-binaries \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd speex
  make -k check
}

package() {
  depends+=(libogg.so libspeexdsp.so)
  provides+=(libspeex.so)

  cd speex
  make DESTDIR="$pkgdir" install
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}
