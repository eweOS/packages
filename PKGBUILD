# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=speexdsp
pkgver=1.2.1
pkgrel=1
pkgdesc="DSP library derived from Speex"
url="https://www.speex.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD)
makedepends=(git)
provides=(libspeexdsp.so)
source=("git+https://gitlab.xiph.org/xiph/speexdsp.git#tag=SpeexDSP-$pkgver")
sha256sums=('d347cde685ff0ab3d320c7f5060f4b18ea8887052660939a03c2b5c096d4e2f1')

prepare() {
  cd speexdsp
  ./autogen.sh
}

build() {
  cd speexdsp
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd speexdsp
  make -k check
}

package() {
  cd speexdsp
  make DESTDIR="$pkgdir" install
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}
