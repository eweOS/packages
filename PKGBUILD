# Maintainer: Sébastien "Seblu" Luttringer <seblu@archlinux.org>

pkgname=nftables
pkgver=1.0.6
pkgrel=1
pkgdesc='Netfilter tables userspace tools'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://netfilter.org/projects/nftables/'
license=('GPL2')
depends=('libmnl' 'libnftnl>=1.2.4' 'gmp' 'readline' 'ncurses' 'jansson')
optdepends=('python: Python bindings')
makedepends=('python')
backup=('etc/nftables.conf')
source=("https://netfilter.org/projects/nftables/files/nftables-$pkgver.tar.xz"
        'config'
        'nftables.service')
sha256sums=('2407430ddd82987670e48dc2fda9e280baa8307abec04ab18d609df3db005e4c'
            'fd0376748e86ea3b856e215799c7df1e8863e655ccf0d20f4bcad66ae7e8a12b'
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
