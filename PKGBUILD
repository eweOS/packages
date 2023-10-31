# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libisofs
pkgver=1.5.6
pkgrel=2
pkgdesc="Library to pack up hard disk files and directories into a ISO 9660 disk image"
arch=(x86_64 aarch64 riscv64)
url="https://dev.lovelyhq.com/libburnia"
license=('GPL')
depends=('acl' 'zlib' 'musl')
makedepends=('autoconf')
source=(https://files.libburnia-project.org/releases/${pkgname}-${pkgver}.tar.gz)
sha256sums=('0152d66a9d340b659fe9c880eb9190f3570fb477ac07cf52e8bcd134a1d30d70')

prepare()
{
  cd "${pkgname}-${pkgver}"
  autoreconf -fiv
}

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
