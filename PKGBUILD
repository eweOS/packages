# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dinit-services
pkgver=20260515.1
pkgrel=1
pkgdesc='Service monitoring / "init" system (service files)'
url='https://github.com/eweOS/dinit-services'
source=(
  "$pkgname::git+$url.git#tag=$pkgver"
  rc.local
)
arch=(any)
license=(Apache)
options=(emptydirs)
makedepends=(git)
depends=(dinit)
sha256sums=('eca0e37a06b2e10184dda2b7a9c99e7205d4ee797b29bcc270b975fbf6906e36'
            '6d6e651bce957f8be540aaa84e5b5185610244fa0bc5b5945ad281be6cc9f2d0')

package()
{
  depends+=(utmps pawprint catnest)

  install -d ${pkgdir}/etc/dinit.d/boot.d
  install -d ${pkgdir}/usr/lib/dinit.d/boot.d
  install -d ${pkgdir}/usr/lib/dinit.d/user/boot.d
  install -d ${pkgdir}/usr/lib/dinit/exec/user
  install -m 0755 rc.local ${pkgdir}/etc/rc.local
  cp -r ${srcdir}/$pkgname/services/* ${pkgdir}/usr/lib/dinit.d/
  cp -r ${srcdir}/$pkgname/user-services/* ${pkgdir}/usr/lib/dinit.d/user/
  cp -r ${srcdir}/$pkgname/exec/* ${pkgdir}/usr/lib/dinit/exec/
  install -d ${pkgdir}/usr/lib/dinit/exec/shutdown
  install -m 0755 ${srcdir}/$pkgname/shutdown-hook ${pkgdir}/usr/lib/dinit/shutdown-hook
}
