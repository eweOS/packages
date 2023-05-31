# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=m4
pkgver=1.4.19
pkgrel=1
arch=(x86_64 aarch64 riscv64)
pkgdesc="The GNU macro processor"
url='http://www.gnu.org/software/m4/'
license=(GPL3)
groups=(base-devel)
depends=(musl bash)

source=(
  "http://ftp.gnu.org/gnu/m4/m4-${pkgver}.tar.xz"
)

sha256sums=('63aede5c6d33b6d9b13511cd0be2cac046f2e70fd0a07aa9573a04a82783af96')

build()
{
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package()
{
  cd "$pkgname-$pkgver"
  make prefix="$pkgdir"/usr install
}
