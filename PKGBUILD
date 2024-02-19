# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=gnupg
pkgdesc='GNU Privacy Guard'
pkgver=2.4.4
pkgrel=1
url='https://gnupg.org'
license=('GPL2')
depends=('musl' 'libassuan' 'libgpg-error' 'npth' 'libksba' 'pinentry'
  'libgcrypt')
source=("https://gnupg.org/ftp/gcrypt/gnupg/gnupg-${pkgver}.tar.bz2")
sha256sums=('67ebe016ca90fa7688ce67a387ebd82c6261e95897db7b23df24ff335be85bc6')
arch=(x86_64 aarch64 riscv64)
provides=(gpg)

build()
{
  cd gnupg-${pkgver}
  ./configure \
    --with-libksba-prefix=/usr \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/gnupg
  make
}

package()
{
  cd gnupg-${pkgver}
  make DESTDIR="${pkgdir}/" install
}
