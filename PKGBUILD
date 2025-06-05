# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=squashfs-tools
pkgver=4.7
pkgrel=1
pkgdesc='Tools for squashfs, a highly compressed read-only filesystem for Linux'
arch=(x86_64 aarch64 riscv64 loongarch64)
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
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz"
	"0001-print_pager-add-missing-includes.patch::https://github.com/plougher/squashfs-tools/commit/e6f58e198d5599ca9eeae084e6f4bbacd9d7960c.patch"
	"0002-generate-manpages-Workaround-busybox-sed.patch")
sha256sums=('f1605ef720aa0b23939a49ef4491f6e734333ccc4bda4324d330da647e105328'
            '1d8a31f352301eaa369d8f610bff6f4664d31995121fab2a9e394e2350d394d5'
            'e358a9d32e90fa970ad924f38d40a8049709dd0d22a3a6618eb04682d0ed1e6b')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

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
}
