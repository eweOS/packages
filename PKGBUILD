# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Sébastien Luttringer

pkgname=lz4
epoch=1
pkgver=1.10.0
pkgrel=1
pkgdesc='Extremely fast compression algorithm'
arch=(x86_64 aarch64 riscv64)
url='https://lz4.github.io/lz4/'
license=('GPL2')
makedepends=('git')
depends=('musl')
source=("git+https://github.com/lz4/lz4.git#tag=v$pkgver")
sha256sums=('SKIP')

build()
{
  # do not use the main makefile, it calls sub make with -e
  # exported CLFAGS by makepkg break the version. see FS#50071
  cd $pkgname
  make -C lib PREFIX=/usr
  make -C programs PREFIX=/usr lz4 lz4c
}

check()
{
  rm -f passwd.lz4
  $pkgname/programs/lz4 /etc/passwd passwd.lz4
  $pkgname/programs/lz4 -d passwd.lz4 passwd
  diff -q /etc/passwd passwd
  rm passwd
}

package()
{
  cd $pkgname
  make install PREFIX=/usr DESTDIR="$pkgdir"
}
