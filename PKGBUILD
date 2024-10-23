# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libppd
pkgver=2.1.0
pkgrel=1
pkgdesc="OpenPrinting - the legacy support library for PPD files"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/OpenPrinting/libppd"
license=('APACHE')
depends=('libcups' 'libcupsfilters')
makedepends=('ghostscript' 'autoconf' 'linux-headers')
source=(
  https://github.com/OpenPrinting/libppd/releases/download/$pkgver/$pkgname-$pkgver.tar.xz
)
sha256sums=('bc4d7f8b749a8809f532459a5dd2f3513556ea2b96b3e12aced3e078c2697cba')

prepare() {
  cd "$pkgname-$pkgver"
  # fix duplicate mkdir
  sed -i 's/-mkdir/-mkdir -p/' install-sh
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr  \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --disable-mutool \
    --disable-pdftops
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  # license
  mkdir -p "$pkgdir"/usr/share/licenses/${pkgname}
  install -m644 "$srcdir/$pkgname-$pkgver"/{COPYING,NOTICE} \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
