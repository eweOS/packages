# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libpcap
pkgver=1.11.1
pkgrel=1
pkgdesc='A system-independent interface for user-level packet capture'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.tcpdump.org/'
license=(BSD-3-Clause)
depends=(musl libnl)
makedepends=(flex bison linux-headers)
source=("https://www.tcpdump.org/release/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7985b1d20ff82c1e384115038046e0b15034648c6f45c92e08601d4ee1b369ed')

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
