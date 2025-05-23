# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libarchive
pkgver=3.8.0
pkgrel=1
pkgdesc='Multi-format archive and compression library'
url='https://libarchive.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('BSD-2-Clause')
depends=('acl' 'openssl' 'xz' 'zlib' 'libbz2' 'zstd')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('67bfac3798a778143f4b1cadcdb3792b4269486f8e1b70ca5c0ee5841398bfdf')

build()
{
  cd "${pkgname}-${pkgver}"
  # Disable libxml2 to simplify dependency graph of our base and base-devel
  # This disables XAR support.
  ./configure --prefix=/usr \
  	--disable-static		\
	--without-xml2			\
	--without-expat
  make
}

package()
{
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  sed -i "s/iconv //" "$pkgdir"/usr/lib/pkgconfig/libarchive.pc
  # replace busybox tar to provide more format/arg support
  ln -s bsdtar $pkgdir/usr/bin/tar
  install -Dm0644 COPYING "$pkgdir/usr/share/licenses/libarchive/COPYING"
}
