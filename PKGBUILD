# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=tree
pkgver=2.3.2
pkgrel=1
pkgdesc="A directory listing program displaying a depth indented list of files"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="http://mama.indstate.edu/users/ice/tree/"
license=('GPL')
depends=('musl')
source=("https://gitlab.com/OldManProgrammer/unix-tree/-/archive/${pkgver}/unix-tree-${pkgver}.tar.gz")
sha512sums=('c22dd6bd6074f521959d31c3c9adbccec5a039029ca818df8345c7572f5b29b4b7b813e9ce4336cc0d600095130a709f7cbf7f88765a7a1e6894b16701d1fcd9')

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
