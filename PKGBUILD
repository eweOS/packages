# Maintainer: Sébastien "Seblu" Luttringer <seblu@archlinux.org>

pkgname=nftables
pkgver=1.0.9
pkgrel=3
pkgdesc='Netfilter tables userspace tools'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://netfilter.org/projects/nftables/'
license=('GPL2')
depends=('libmnl' 'libnftnl' 'gmp' 'readline' 'ncurses' 'jansson')
optdepends=('python: Python bindings')
makedepends=('python' 'python-setuptools' 'python-build'
             'python-installer' 'python-wheel' 'linux-headers')
backup=('etc/nftables.conf')
source=("https://netfilter.org/projects/nftables/files/nftables-$pkgver.tar.xz"
        'config'
        'nftables.service')
sha256sums=('a3c304cd9ba061239ee0474f9afb938a9bb99d89b960246f66f0c3a0a85e14cd'
            'e4555d37862430eb1317210132bc4d87bca258bafccf06ee39ea0481237e1483'
            '1fbfc801aafa2a52581a99c56cae2986deadf6eed0a77c27cb0ddc2575e60c7f')

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
