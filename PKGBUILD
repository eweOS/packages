# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=m4
pkgver=1.4.19
pkgrel=1
arch=(x86_64 aarch64)
pkgdesc="The GNU macro processor"
url='http://www.gnu.org/software/m4/'
license=(GPL3)
groups=(base-devel)
depends=(musl bash)

source=(
  "http://ftp.gnu.org/gnu/m4/m4-${pkgver}.tar.xz"
)

sha256sums=(
  'SKIP'
)

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
