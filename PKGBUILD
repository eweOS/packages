# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=alsa-utils
pkgver=1.2.12
pkgrel=1
pkgdesc="Advanced Linux Sound Architecturei (ALSA) - Utilities"
arch=(x86_64 aarch64 riscv64)
url="https://www.alsa-project.org"
license=(GPL2)
depends=(alsa-lib ncurses)
makedepends=(alsa-lib ncurses)
options=(emptydirs)
source=($url/files/pub/utils/$pkgname-$pkgver.tar.bz2)
sha512sums=('6631f9f8e32fbb1f7b06af086cdfb8349c2d70188c4509ab46fa105024fbde9985985d9cc738c7b5a743cacaaeae7a7006f8ef92f66a50762f7df5d714bf548b')

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
