# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=gnupg
pkgdesc='GNU Privacy Guard'
pkgver=2.4.5
pkgrel=3
url='https://gnupg.org'
license=('GPL-2.0-or-later')
depends=('musl' 'libassuan' 'libgpg-error' 'npth' 'libksba' 'pinentry'
	 'libgcrypt')
optdepends=('ntbtls: For dirmngr support')
makedepends=('ntbtls')
source=("https://gnupg.org/ftp/gcrypt/gnupg/gnupg-${pkgver}.tar.bz2")
sha256sums=('f68f7d75d06cb1635c336d34d844af97436c3f64ea14bcb7c869782f96f44277')
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
