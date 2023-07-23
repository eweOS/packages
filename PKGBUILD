# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=gnupg
pkgdesc='GNU Privacy Guard'
pkgver=2.4.3
pkgrel=1
url='https://gnupg.org'
license=('GPL2')
depends=('musl' 'libassuan' 'libgpg-error' 'npth' 'libksba' 'pinentry'
  'libgcrypt')
source=("https://gnupg.org/ftp/gcrypt/gnupg/gnupg-${pkgver}.tar.bz2")
sha256sums=('a271ae6d732f6f4d80c258ad9ee88dd9c94c8fdc33c3e45328c4d7c126bd219d')
arch=(x86_64 aarch64)
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
