# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=gnupg
pkgdesc='GNU Privacy Guard'
pkgver=2.4.0
pkgrel=2
url='https://gnupg.org'
license=('GPL2')
depends=('musl' 'libassuan' 'libgpg-error' 'npth' 'libksba' 'pinentry'
  'libgcrypt')
source=("https://gnupg.org/ftp/gcrypt/gnupg/gnupg-${pkgver}.tar.bz2")
sha256sums=('1d79158dd01d992431dd2e3facb89fdac97127f89784ea2cb610c600fb0c1483')
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
