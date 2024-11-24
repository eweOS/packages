# Maintainer: Sébastien "Seblu" Luttringer <seblu@archlinux.org>

pkgname=nftables
pkgver=1.1.1
pkgrel=2
pkgdesc='Netfilter tables userspace tools'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://netfilter.org/projects/nftables/'
license=('GPL2')
depends=('libmnl' 'libnftnl' 'gmp' 'readline' 'ncurses' 'jansson')
optdepends=('python: Python bindings')
makedepends=('python' 'python-setuptools' 'python-build'
             'python-installer' 'python-wheel' 'linux-headers' 'autoconf')
backup=('etc/nftables.conf')
source=("https://netfilter.org/projects/nftables/files/nftables-$pkgver.tar.xz"
        'config'
        'nftables.service')
sha256sums=('6358830f3a64f31e39b0ad421d7dadcd240b72343ded48d8ef13b8faf204865a'
            'e4555d37862430eb1317210132bc4d87bca258bafccf06ee39ea0481237e1483'
	    'af89ba2491772ff5a2a1b85f171e091d5c007398716959cc452c6a2836e73a94')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/usr/share \
    --with-json \
    --with-cli=readline \
    --disable-debug
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 $srcdir/config "$pkgdir/etc/nftables.conf"
  _dinit_install_services_ $srcdir/nftables.service
  _dinit_enable_services_ nftables
}
