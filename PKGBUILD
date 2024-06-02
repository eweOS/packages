# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=turnstile
pkgver=0.1.8
pkgrel=1
pkgdesc='Independent session/login tracker'
url='https://github.com/chimera-linux/turnstile'
arch=(x86_64 aarch64 riscv64)
license=(BSD-2-Clause)
depends=(pam)
makedepends=(meson ninja scdoc)
source=("git+$url.git#tag=v$pkgver" turnstiled.service dinit.conf)
sha256sums=('SKIP'
            '257fd00dc1f6ba7e79b70604aa358e481cff60b318de8d78b829acdec56f7eff'
            '77fc59cdb2134684f6087a1f2390b6a524216115ea420a94c318b53fecb540e4')

build () {
  ewe-meson $pkgname build -D manage_rundir=true
  meson compile -C build
}

package() {
  depends+=(dinit)

  meson install -C build --destdir $pkgdir
  
  # we use our own version of dinit service
  rm -r $pkgdir/etc/dinit.d
  _dinit_install_services_ $srcdir/turnstiled.service
  _dinit_enable_services_ turnstiled
  
  # install turnstiled as dependency of greetd
  install -d $pkgdir/usr/lib/dinit/system/greetd.d
  ln -s ../turnstiled $pkgdir/usr/lib/dinit/system/greetd.d/
  
  # we use our own dinit user service config
  cp $srcdir/dinit.conf $pkgdir/etc/turnstile/backend/dinit.conf
  
  _install_license_ $pkgname/COPYING.md
}
