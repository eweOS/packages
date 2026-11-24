# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libmicrohttpd
pkgver=1.0.11
pkgrel=1
pkgdesc='a small C library that is supposed to make it easy to run an HTTP server as part of another application.'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.gnu.org/software/libmicrohttpd/'
license=('LGPL-2.1-or-later')
depends=('musl')
checkdepends=('curl')
provides=('libmicrohttpd.so')
# 0001: Downstream, bump MHD_VERSION to match 1.0.11; upstream forgot to update it.
# Arch Linux applies the same workaround.
# TODO: Drop when fixed upstream.
source=(
  "https://ftp.gnu.org/gnu/libmicrohttpd/$pkgname-$pkgver.tar.gz"
  "0001-bump-MHD_VERSION.patch"
)
sha256sums=('f227a044b75688e449b58ddedf0582255cc562899ff69f173a8ef76439744b4e'
            'c879768b05541c2c7489d7217bd64e48b3f659095d77f6871c37ec95fcca1988')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

build()
{
  cd ${pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --disable-dependency-tracking \
    --disable-examples \
    --disable-heavy-tests \
    --disable-nls \
    --enable-curl \
    --enable-largefile \
    --enable-messages \
    --with-pic

  # --enable-https needs gnutls
  make
}

check()
{
  cd ${pkgname}-${pkgver}

  make check
}

package()
{
  cd ${pkgname}-${pkgver}

  make DESTDIR="$pkgdir" install
  find $pkgdir -name "*.png" -delete
}
