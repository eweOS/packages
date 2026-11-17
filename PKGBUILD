# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=kirc
pkgver=1.2.2
pkgrel=1
pkgdesc="A tiny IRC client written in POSIX C99"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/mcpcpc/kirc"
license=('MIT')
depends=('musl')
source=("https://github.com/mcpcpc/kirc/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a54bc4d1a644f6fcb610f702454affc241b26da7fbde51951e0ec59133fa7b1d')

prepare()
{
  cd $pkgname-$pkgver
  # do not remove bin before install
  sed -i 's/all: clean kirc/all: kirc/g' Makefile
}

build()
{
  cd ${pkgname}-${pkgver}

  make
}

package()
{
  cd ${pkgname}-${pkgver}

  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
