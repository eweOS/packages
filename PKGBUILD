# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=gnupg
pkgdesc='GNU Privacy Guard'
pkgver=2.4.9
pkgrel=2
url='https://gnupg.org'
license=('GPL-2.0-or-later')
depends=('musl' 'libassuan' 'libgpg-error' 'npth' 'libksba' 'pinentry'
	 'libgcrypt')
optdepends=('ntbtls: For dirmngr support')
makedepends=('ntbtls')
source=("https://gnupg.org/ftp/gcrypt/gnupg/gnupg-${pkgver}.tar.bz2")
sha256sums=('dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a4ddeb4176fd8b302964')
arch=(x86_64 aarch64 riscv64 loongarch64)
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
