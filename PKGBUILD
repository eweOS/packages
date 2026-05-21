# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libisofs
pkgver=1.5.8
pkgrel=2
pkgdesc="Library to pack up hard disk files and directories into a ISO 9660 disk image"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://dev.lovelyhq.com/libburnia"
license=('GPL')
depends=('acl' 'zlib' 'musl')
makedepends=('autoconf')
source=(https://files.libburnia-project.org/releases/${pkgname}-${pkgver}.tar.gz)
sha256sums=('910532653e6a56b5e4c2ef8717500d913debd5fd29f616fed15134b7522059a6')

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
