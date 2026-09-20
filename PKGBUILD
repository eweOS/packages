# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libpcap
pkgver=1.11.0
pkgrel=1
pkgdesc='A system-independent interface for user-level packet capture'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.tcpdump.org/'
license=(BSD-3-Clause)
depends=(musl libnl)
makedepends=(flex bison linux-headers)
source=("https://www.tcpdump.org/release/${pkgname}-${pkgver}.tar.gz")
sha256sums=('596389bc8560ea027dff9db8aaf6c173d992366d9aef4baf5d7c6d180b4d49ad')

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
