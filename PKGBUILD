# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=turnstile
pkgver=0.1.10
pkgrel=2
pkgdesc='Independent session/login tracker'
url='https://github.com/chimera-linux/turnstile'
arch=(x86_64 aarch64 riscv64)
license=(BSD-2-Clause)
depends=(pam)
makedepends=(meson ninja scdoc)
source=("git+$url.git#tag=v$pkgver" turnstiled.service)
sha256sums=('e36592e97fc4613a46b71f661e57c118aab20d451f92733728c00b5a45aa57a2'
	'257fd00dc1f6ba7e79b70604aa358e481cff60b318de8d78b829acdec56f7eff')

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
  install -d $pkgdir/usr/lib/dinit.d/greetd.d
  ln -s ../turnstiled $pkgdir/usr/lib/dinit.d/greetd.d/
  
  _install_license_ $pkgname/COPYING.md
}
