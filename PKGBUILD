# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=squashfs-tools
pkgver=4.6.1
pkgrel=2
pkgdesc='Tools for squashfs, a highly compressed read-only filesystem for Linux'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/plougher/squashfs-tools'
license=(GPL2)
depends=(
  lz4
  lzo
  xz
  zlib
  zstd
)
makedepends=(help2man)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('94201754b36121a9f022a190c75f718441df15402df32c2b520ca331a107511c')

build() {
  local make_options=(
    GZIP_SUPPORT=1
    LZ4_SUPPORT=1
    LZMA_XZ_SUPPORT=1
    LZO_SUPPORT=1
    XATTR_SUPPORT=1
    XZ_SUPPORT=1
    ZSTD_SUPPORT=1
    -C $pkgname-$pkgver/$pkgname
  )

  make "${make_options[@]}"
}

package() {
  local make_options=(
    INSTALL_PREFIX="$pkgdir/usr"
    INSTALL_MANPAGES_DIR='$(INSTALL_PREFIX)/share/man/man1'
    install
    -C $pkgname-$pkgver/$pkgname
  )

  make "${make_options[@]}"
  install -vDm 644 $pkgname-$pkgver/{ACTIONS-README,CHANGES,"README-$pkgver",USAGE*} -t "$pkgdir/usr/share/doc/$pkgname/"
}

