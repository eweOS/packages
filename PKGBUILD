# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=gnupg
pkgdesc='GNU Privacy Guard'
pkgver=2.5.0
pkgrel=1
url='https://gnupg.org'
license=('GPL2')
depends=('musl' 'libassuan' 'libgpg-error' 'npth' 'libksba' 'pinentry'
  'libgcrypt')
source=("https://gnupg.org/ftp/gcrypt/gnupg/gnupg-${pkgver}.tar.bz2")
sha256sums=('2222c827d4e7087f15e7f72739d004abc1d05c6c5f0a5a12b24c6a6cc5d173fb')
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
