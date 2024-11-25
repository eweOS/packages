# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=tree
pkgver=2.2.0
pkgrel=1
pkgdesc="A directory listing program displaying a depth indented list of files"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="http://mama.indstate.edu/users/ice/tree/"
license=('GPL')
depends=('musl')
source=("https://gitlab.com/OldManProgrammer/unix-tree/-/archive/${pkgver}/unix-tree-${pkgver}.tar.gz")
sha512sums=('95fd7b443a8005df27fb3c917ebbde2832499c0d09319950bb2633c1caf25b033224bcced38ea06a1e2491f21780cc36672e22b0c6355ede944f282a9d88ffcf')

prepare()
{
  cd "unix-tree-${pkgver}"
  sed -i -e '/^CFLAGS/d' -e '/^LDFLAGS/d' -e '/^CC=/d' Makefile
}

build()
{
  cd "unix-tree-${pkgver}"
  make
}

package()
{
  cd "unix-tree-${pkgver}"
  make PREFIX="${pkgdir}/usr" MANDIR="${pkgdir}/usr/share/man" install
}
