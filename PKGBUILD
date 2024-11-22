# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mtools
pkgver=4.0.46
pkgrel=1
pkgdesc="A collection of utilities to access MS-DOS disks"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.gnu.org/software/mtools/"
license=(GPL-3.0-or-later)
depends=(bash)
makedepends=(texinfo)
backup=(etc/$pkgname.conf)
source=(https://ftp.gnu.org/gnu/mtools/$pkgname-$pkgver.tar.bz2)
sha256sums=('9aad8dd859f88fb7787924ec47590192d3abf7bad6c840509c854290d6bc16c0')

prepare() {
  # comment entry in default config
  sed -e '/^SAMPLE FILE$/s:^:# :' -i $pkgname-$pkgver/mtools.conf
}

build() {
  local configure_options=(
    --prefix=/usr
    --mandir=/usr/share/man
    --infodir=/usr/share/info
    --sysconfdir=/etc
  )

  cd $pkgname-$pkgver
  ./configure "${configure_options[@]}"
  make
}

check() {
  make -k check -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/mtools.conf -t "$pkgdir/etc/"
  install -vDm 644 $pkgname-$pkgver/{README,NEWS} -t "$pkgdir/usr/share/doc/$pkgname"
}
