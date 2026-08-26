# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=rsync
pkgver=3.5.0
pkgrel=1
pkgdesc='A fast and versatile file copying tool for remote and local files'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://rsync.samba.org/'
license=('GPL-3.0-or-later')
depends=('acl' 'attr' 'musl' 'openssl' 'lz4' 'popt' 'xxhash' 'zlib' 'zstd')
makedepends=('linux-uapi-headers')
source=(https://github.com/WayneD/rsync/archive/refs/tags/v${pkgver}.tar.gz
	rsyncd.conf
	rsyncd.service
	workaround-awk-bug.patch)
sha256sums=('d2f6affada77df897072062f7b9eefe9239e7738a5544803462f7fe63c6655a7'
            'f1b14a01cfa3bbe6eecfd3491c9d1d43a51a2561dc9808485ca5d21941d660e5'
            'b44550b85b1a1365080367c0dc02151ce00afa41debc4372a94c1c6c53156331'
            '831492ff00d3e086a82cad36572cc4ebb72fef27e9269c4fb6f62677e6f8fd6f')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --disable-debug \
    --with-included-popt=no \
    --with-included-zlib=no \
    --disable-md2man
  make
}

package() {
  backup=(etc/rsyncd.conf)

  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  _dinit_install_services_ $srcdir/rsyncd.service
  install -Dm 0644 $srcdir/rsyncd.conf $pkgdir/etc/rsyncd.conf
}
