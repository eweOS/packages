# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libarchive
pkgver=3.6.2
pkgrel=1
pkgdesc='Multi-format archive and compression library'
url='https://libarchive.org/'
arch=('x86_64' 'aarch64')
license=('BSD')
depends=('acl' 'openssl' 'xz' 'zlib' 'libxml2')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('SKIP')

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
  install -Dm0644 COPYING "$pkgdir/usr/share/licenses/libarchive/COPYING"
}
