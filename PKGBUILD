# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=tree
pkgver=2.3.1
pkgrel=1
pkgdesc="A directory listing program displaying a depth indented list of files"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="http://mama.indstate.edu/users/ice/tree/"
license=('GPL')
depends=('musl')
source=("https://gitlab.com/OldManProgrammer/unix-tree/-/archive/${pkgver}/unix-tree-${pkgver}.tar.gz")
sha512sums=('802c7e6a8065da019890b9319782d1f35e36eda86a5adbf9d5fe181e444c8322a73863ebcbaeb45e25643f8fd61ff56e6d874528c9f2e944ec0afc53a5fd5ecf')

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
