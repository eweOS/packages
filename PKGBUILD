# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libpcap
pkgver=1.10.5
pkgrel=2
pkgdesc='A system-independent interface for user-level packet capture'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.tcpdump.org/'
license=(BSD-3-Clause)
depends=(musl libnl)
makedepends=(flex bison linux-headers)
source=("https://www.tcpdump.org/release/${pkgname}-${pkgver}.tar.gz")
sha256sums=('37ced90a19a302a7f32e458224a00c365c117905c2cd35ac544b6880a81488f0')

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
