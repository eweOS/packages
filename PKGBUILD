# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=m4
pkgver=1.4.20
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
pkgdesc="The GNU macro processor"
url='http://www.gnu.org/software/m4/'
license=(GPL3)
groups=(base-devel)
depends=(musl bash)
makedepends=(autoconf)
source=(
  "http://ftp.gnu.org/gnu/m4/m4-${pkgver}.tar.xz"
  stack-direction-add-loongarch.patch
)

sha256sums=('e236ea3a1ccf5f6c270b1c4bb60726f371fa49459a8eaaebc90b216b328daf2b'
            '358c938ba8ad3b4cb36f0532026cc2c57f130fd290f20245594019875fb18d27')

prepare()
{
  _patch_ "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  autoreconf -fiv
}

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
