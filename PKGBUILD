# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=dinit-services
pkgname=dinit-services
pkgver=20260401.1
pkgrel=1
pkgdesc='Service monitoring / "init" system (service files)'
url='https://github.com/eweOS/dinit-services'
source=(
  "$pkgbase::git+$url.git#tag=$pkgver"
  rc.local
)
arch=(any)
license=(Apache)
options=(emptydirs)
makedepends=(git)
depends=(dinit)
sha256sums=('70d1e86ff7bced3a78d086b3c5f4c77eb954ba42180a99a0207a40b194520def'
            '6d6e651bce957f8be540aaa84e5b5185610244fa0bc5b5945ad281be6cc9f2d0')

package()
{
  depends+=(utmps pawprint catnest)

  install -d ${pkgdir}/etc/dinit.d/boot.d
  install -d ${pkgdir}/usr/lib/dinit.d/boot.d
  install -d ${pkgdir}/usr/lib/dinit.d/user/boot.d
  install -d ${pkgdir}/usr/lib/dinit/exec/user
  install -m 0755 rc.local ${pkgdir}/etc/rc.local
  cp -r ${srcdir}/$pkgbase/services/* ${pkgdir}/usr/lib/dinit.d/
  cp -r ${srcdir}/$pkgbase/user-services/* ${pkgdir}/usr/lib/dinit.d/user/
  cp -r ${srcdir}/$pkgbase/exec/* ${pkgdir}/usr/lib/dinit/exec/
  install -d ${pkgdir}/usr/lib/dinit/exec/shutdown
  install -m 0755 ${srcdir}/$pkgbase/shutdown-hook ${pkgdir}/usr/lib/dinit/shutdown-hook
}
