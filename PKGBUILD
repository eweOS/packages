# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=sockstat
pkgdesc='FreeBSD utility to display information about open sockets.'
pkgver=0.4.2
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL2')
url='https://packages.debian.org/sid/sockstat'
source=("http://deb.debian.org/debian/pool/main/s/sockstat/sockstat_${pkgver}.orig.tar.gz")
sha256sums=('f4b19d3a757f80308c0b94562cc2cfa1f12d1eb63f172e167b8319db8e6870e2')

build()
{
  cd "${srcdir}/sockstat"
  make
}

package()
{
  cd "${srcdir}/sockstat"

  install -d $pkgdir/usr/bin
  make DESTDIR="$pkgdir" install

  install -Dm644 sockstat.1 $pkgdir/usr/share/man/man1/sockstat.1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
