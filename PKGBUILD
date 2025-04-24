# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libarchive
pkgver=3.7.9
pkgrel=1
pkgdesc='Multi-format archive and compression library'
url='https://libarchive.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('BSD')
depends=('acl' 'openssl' 'xz' 'zlib' 'libxml2' 'libbz2' 'zstd')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('ed8b5732e4cd6e30fae909fb945cad8ff9cb7be5c6cdaa3944ec96e4a200c04c')

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
