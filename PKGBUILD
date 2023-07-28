pkgname=libisofs
pkgver=1.5.4
pkgrel=1
pkgdesc="Library to pack up hard disk files and directories into a ISO 9660 disk image"
arch=(x86_64 aarch64 riscv64)
url="https://dev.lovelyhq.com/libburnia"
license=('GPL')
depends=('acl' 'zlib' 'musl')
source=(https://files.libburnia-project.org/releases/${pkgname}-${pkgver}.tar.gz)
sha256sums=('aaa0ed80a7501979316f505b0b017f29cba0ea5463b751143bad2c360215a88e')

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
