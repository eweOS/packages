# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=gnupg
pkgdesc='GNU Privacy Guard'
pkgver=2.4.8
pkgrel=1
url='https://gnupg.org'
license=('GPL-2.0-or-later')
depends=('musl' 'libassuan' 'libgpg-error' 'npth' 'libksba' 'pinentry'
	 'libgcrypt')
optdepends=('ntbtls: For dirmngr support')
makedepends=('ntbtls')
source=("https://gnupg.org/ftp/gcrypt/gnupg/gnupg-${pkgver}.tar.bz2")
sha256sums=('b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bcdd060595318616')
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
