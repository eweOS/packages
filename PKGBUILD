# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pawprint
pkgver=0.1.0
pkgrel=4
pkgdesc="A substitution of systemd-tmpfiles"
url="https://github.com/eweOS/pawprint"
license=(MIT)
arch=(x86_64 aarch64 riscv64)
makedepends=(git linux-headers)
source=(
  "$pkgname::git+$url.git#branch=main"
  "$pkgname.service"
  pawprint-reload.hook
  pawprint-reload.script
)
sha256sums=('SKIP'
            'f93ee18de7c6f6426427a7ce7aa8632d85802fbc5a1178860f7ba26a262506eb'
            'a47a75887d912acc603434e0b93d8407a2410e75892cd0599f884721144c868a'
            '1a22a7add0b8e29932ba7d2ac0efeb78d95807b1194e2c40862d1d7b09ef6675')

build()
{
  cd $pkgname
  cc -o $pkgname $pkgname.c -DARCH=$arch
}

package()
{
  cd $pkgname
  install -D $pkgname $pkgdir/usr/bin/$pkgname
  install -d $pkgdir/etc/tmpfiles.d

  _dinit_install_services_ $srcdir/$pkgname.service

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 $srcdir/pawprint-reload.hook
  install -Dt "$pkgdir/usr/share/libalpm/scripts" -m755 $srcdir/pawprint-reload.script
}
