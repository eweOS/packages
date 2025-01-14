# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=kirc
pkgver=0.3.3
pkgrel=1
pkgdesc="A tiny IRC client written in POSIX C99"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/mcpcpc/kirc"
license=('MIT')
depends=('musl')
source=("https://github.com/mcpcpc/kirc/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c76e545efc400486401f387ef266260d4508f9b6265df7f61c0d5b002fec164b')

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
