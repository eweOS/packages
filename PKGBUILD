# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=rsync
pkgver=3.2.7
pkgrel=1
pkgdesc='A fast and versatile file copying tool for remote and local files'
arch=('x86_64' 'aarch64')
url='https://rsync.samba.org/'
license=('GPL3')
depends=('acl' 'openssl' 'perl' 'popt'
  'zlib')
source=(https://github.com/WayneD/rsync/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('4f2a350baa93dc666078b84bc300767a77789ca12f0dec3cb4b3024971f8ef47')

build()
{
  cd "$srcdir/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --disable-debug \
    --with-included-popt=no \
    --with-included-zlib=no \
    --disable-md2man \
    --disable-xxhash \
    --disable-zstd \
    --disable-lz4
  make
}

package()
{
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
