# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=alsa-utils
pkgver=1.2.14
pkgrel=1
pkgdesc="Advanced Linux Sound Architecturei (ALSA) - Utilities"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.alsa-project.org"
license=(GPL2)
depends=(alsa-lib ncurses)
makedepends=(alsa-lib ncurses)
options=(emptydirs)
source=($url/files/pub/utils/$pkgname-$pkgver.tar.bz2)
sha512sums=('dd470a2f5210822cc4d3ded094b84721a07904df5c32dd329e0cb4c052d39e3e6d7ddb511cde2d23b3f6824c71fba9dbdca369355d5c03b234e989dbbb9b7a95')

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
