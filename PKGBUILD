# Maintainer: Sébastien "Seblu" Luttringer <seblu@archlinux.org>

pkgname=nftables
pkgver=1.1.7
pkgrel=1
pkgdesc='Netfilter tables userspace tools'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://netfilter.org/projects/nftables/'
license=('GPL-2.0-only')
depends=('libmnl' 'libnftnl' 'gmp' 'readline' 'ncurses' 'jansson')
optdepends=('python: Python bindings')
makedepends=('python' 'python-setuptools' 'python-build'
             'python-installer' 'python-wheel' 'linux-headers' 'autoconf')
backup=('etc/nftables.conf')
source=("https://netfilter.org/projects/nftables/files/nftables-$pkgver.tar.xz"
        'config'
        'nftables.service')
sha256sums=('a6fbf060d8d4fff001517a2b94f356bb4366bfbf0ba366366f9d27cc38caa58f'
            'e4555d37862430eb1317210132bc4d87bca258bafccf06ee39ea0481237e1483'
            '09c2e40ef5eb022dd38419136f79631b1e26e371adb7fa6bef1168084c8977a0')

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
