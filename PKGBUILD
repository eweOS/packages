# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=kirc
pkgver=0.3.2
pkgrel=1
pkgdesc="A tiny IRC client written in POSIX C99"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/mcpcpc/kirc"
license=('MIT')
depends=('musl')
source=("https://github.com/mcpcpc/kirc/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a45172198873fb34c64150262be4515a7be268a5c00566c79f03a8ea2dd7900e')

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
