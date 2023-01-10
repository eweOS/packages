pkgname=libisofs
pkgver=1.5.4
pkgrel=1
pkgdesc="Library to pack up hard disk files and directories into a ISO 9660 disk image"
arch=(x86_64 aarch64)
url="https://dev.lovelyhq.com/libburnia"
license=('GPL')
depends=('acl' 'zlib' 'musl')
source=(https://files.libburnia-project.org/releases/${pkgname}-${pkgver}.tar.gz)
sha256sums=('SKIP')

build()
{
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --enable-libacl \
    --enable-xattr \
    --disable-static
  make
}

package()
{
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
