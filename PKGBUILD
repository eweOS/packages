# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=dinit-services
pkgname=dinit-services
pkgver=20240924.1
pkgrel=1
pkgdesc='Service monitoring / "init" system (service files)'
url='https://github.com/eweOS/dinit-services'
source=(
  "$pkgbase::git+$url.git#tag=$pkgver"
  rc.local shutdown-hook
)
arch=(any)
license=(Apache)
options=(emptydirs)
makedepends=(git)
depends=(dinit)
sha256sums=('1c22453292000109f29d04237cd48d10a72e739b1b6faa6491fa1c92918a25cf'
            '6d6e651bce957f8be540aaa84e5b5185610244fa0bc5b5945ad281be6cc9f2d0'
            '9869773f5cd14c92d8107721b0ed866fec60e91d6b8a42e419719a8ee623c699')

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
  install -m 0755 shutdown-hook ${pkgdir}/usr/lib/dinit/shutdown-hook
}
