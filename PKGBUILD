# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libpcap
pkgver=1.10.1
pkgrel=1
pkgdesc='A system-independent interface for user-level packet capture'
arch=(x86_64 aarch64)
url='https://www.tcpdump.org/'
license=(BSD)
depends=(musl libnl)
makedepends=(flex bison)
source=("https://www.tcpdump.org/release/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ed285f4accaf05344f90975757b3dbfe772ba41d1c401c2648b7fa45b711bdd4')

build()
{
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --enable-ipv6 \
    --with-libnl
  make
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
