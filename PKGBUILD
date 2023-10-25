# Maintainer:Yukari Chiba <i@0x7f.cc>

pkgname=gperf
pkgver=3.1
pkgrel=2
pkgdesc="Perfect hash function generator"
arch=(x86_64 aarch64 riscv64)
url="https://www.gnu.org/software/gperf/"
license=('GPL3')
depends=('llvm-libs')
source=(
	"https://ftp.gnu.org/pub/gnu/gperf/${pkgname}-${pkgver}.tar.gz"
	"fix-cxx17.patch"
)
sha256sums=('588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2'
            '320321c3dcec75933c9d892e6e8952faf7fbca3ea7f8febd798c44d93ccfebff')

prepare()
{
  cd ${pkgname}-${pkgver}
  patch -p1 < ../fix-cxx17.patch
}

build()
{
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
