# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=iftop
pkgver=1.0pre4
pkgrel=1
pkgdesc="Display bandwidth usage on an interface"
arch=(x86_64 aarch64 riscv64)
url="http://www.ex-parrot.com/~pdw/iftop/"
license=('GPL')
depends=('libpcap' 'ncurses')
source=("http://www.ex-parrot.com/~pdw/$pkgname/download/$pkgname-$pkgver.tar.gz"
        mac-address-fix.patch)
sha512sums=('abd74e8025bb82fef9ebab4997b1d018201a523d47c0128128ca37797490046538d74758dc4471735c22b890e5bd238ad6b2a30776d465138ede367cdd263d22'
            '6906bae0eb6beb2e8245648a74601af3024b82d7e826fe49c40a272f98a14b52c39e3caf5985b5f16c460e3096bf6d87e6eb84c166e577f67596f887d997250c')

prepare() {
  cd $pkgname-$pkgver
  # FS#75357
  patch -p0 -i ../mac-address-fix.patch
}

build() {
  cd $pkgname-$pkgver

  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common

  ./configure --prefix=/usr --sbindir=/usr/bin --mandir=/usr/share/man
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
