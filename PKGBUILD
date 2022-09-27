# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=sockstat
pkgdesc='FreeBSD utility to display information about open sockets.'
pkgver=0.4.1
pkgrel=1
arch=('x86_64')
license=('GPL2')
url='https://packages.debian.org/sid/sockstat'
source=("http://deb.debian.org/debian/pool/main/s/sockstat/sockstat_${pkgver}.orig.tar.gz")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/sockstat-${pkgver}"
	make
}

package() {
   cd "${srcdir}/sockstat-${pkgver}"

   install -d $pkgdir/usr/bin
   make DESTDIR="$pkgdir" install

   install -Dm644 sockstat.1 $pkgdir/usr/share/man/man1/sockstat.1
   install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE 
}

