# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=rsync
pkgver=3.3.0
pkgrel=1
pkgdesc='A fast and versatile file copying tool for remote and local files'
arch=(x86_64 aarch64 riscv64)
url='https://rsync.samba.org/'
license=('GPL3')
depends=('acl' 'openssl' 'perl' 'popt'
  'zlib')
source=(https://github.com/WayneD/rsync/archive/refs/tags/v${pkgver}.tar.gz rsyncd.conf rsyncd.service)
sha256sums=('bbc07ef74ac9e9b1506f7029c3a3630dd24cf270ee5256e96553bbd1cfd21610'
            'f1b14a01cfa3bbe6eecfd3491c9d1d43a51a2561dc9808485ca5d21941d660e5'
            '31d640a82d022281736c9d61f971e6946541a9a8f11bc303479ff429a99cb99e')

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
  _dinit_install_services_ $srcdir/rsyncd.service
  install -Dm 0644 $srcdir/rsyncd.conf $pkgdir/etc/rsyncd.conf
}
