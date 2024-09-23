# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libarchive
pkgver=3.7.6
pkgrel=1
pkgdesc='Multi-format archive and compression library'
url='https://libarchive.org/'
arch=(x86_64 aarch64 riscv64)
license=('BSD')
depends=('acl' 'openssl' 'xz' 'zlib' 'libxml2' 'libbz2' 'zstd')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('0a2efdcb185da2eb1e7cd8421434cb9a6119f72417a13335cca378d476fd3ba0')

build()
{
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static
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
