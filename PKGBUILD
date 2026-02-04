# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libpcap
pkgver=1.10.6
pkgrel=1
pkgdesc='A system-independent interface for user-level packet capture'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.tcpdump.org/'
license=(BSD-3-Clause)
depends=(musl libnl)
makedepends=(flex bison linux-headers)
source=("https://www.tcpdump.org/release/${pkgname}-${pkgver}.tar.gz")
sha256sums=('872dd11337fe1ab02ad9d4fee047c9da244d695c6ddf34e2ebb733efd4ed8aa9')

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
