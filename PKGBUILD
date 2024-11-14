# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=alsa-utils
pkgver=1.2.13
pkgrel=1
pkgdesc="Advanced Linux Sound Architecturei (ALSA) - Utilities"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.alsa-project.org"
license=(GPL2)
depends=(alsa-lib ncurses)
makedepends=(alsa-lib ncurses)
options=(emptydirs)
source=($url/files/pub/utils/$pkgname-$pkgver.tar.bz2)
sha512sums=('0e2fb5b6e497b977badba2ebe2bddfc819654d24001622e0299e4034210caeeea2f3c2c2d1d260a48caefb6584e0b989fdb7036c6012108c8c38d89b3cb04c78')

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
