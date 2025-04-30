# Maintainer: Sébastien "Seblu" Luttringer <seblu@archlinux.org>

pkgname=nftables
pkgver=1.1.3
pkgrel=1
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
sha256sums=('9c8a64b59c90b0825e540a9b8fcb9d2d942c636f81ba50199f068fde44f34ed8'
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
