# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=tree
pkgver=2.1.2
pkgrel=1
pkgdesc="A directory listing program displaying a depth indented list of files"
arch=(x86_64 aarch64 riscv64)
url="http://mama.indstate.edu/users/ice/tree/"
license=('GPL')
depends=('musl')
source=("https://gitlab.com/OldManProgrammer/unix-tree/-/archive/${pkgver}/unix-tree-${pkgver}.tar.gz")
sha512sums=('e65dcded94379020ab305362e3531ffeb644e40980d48863c23217ed23cce8c186f6bd0738f32c39e64beae20b3b12d0d7b0c23925b2df5d5b4a1da16abbdc73')

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
