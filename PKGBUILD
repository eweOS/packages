# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=alsa-utils
pkgver=1.2.16
pkgrel=1
pkgdesc="Advanced Linux Sound Architecturei (ALSA) - Utilities"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.alsa-project.org"
license=(GPL2)
depends=(alsa-lib ncurses)
makedepends=(alsa-lib ncurses)
options=(emptydirs)
source=($url/files/pub/utils/$pkgname-$pkgver.tar.bz2)
sha512sums=('288c042f5acb8a7cf1b0a0c25327c74e0bce126124253bdb2d0dc2630b8bc80b5e5d694de97738d031377fd82d887db32af1c4b27c6d940357b318d0a3ef02cf')

prepare()
{
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build()
{
  local configure_options=(
    --prefix=/usr
    --sbindir=/usr/bin
    --with-udev-rules-dir=/usr/lib/udev/rules.d
  )

  cd $pkgname-$pkgver
  ./configure "${configure_options[@]}"
  make
}

check()
{
  make -k check -C $pkgname-$pkgver
}

package()
{
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  # dir where to save ALSA state
  install -vdm 755 "$pkgdir/var/lib/alsa/"
}
