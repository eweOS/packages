# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libarchive
pkgver=3.8.11
pkgrel=1
pkgdesc='Multi-format archive and compression library'
url='https://libarchive.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('BSD-2-Clause')
depends=('acl' 'openssl' 'xz' 'zlib' 'libbz2' 'zstd')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('a3dc0872b1b39da34dc18ef1b944f0f11ffd37425d70ae04be679279f1cf43d2')

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
