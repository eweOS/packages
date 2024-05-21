# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgbase=dinit
pkgname=(dinit dinit-services)
pkgver=0.17.1
pkgrel=3
_service_ver=0.1.2
pkgdesc='Service monitoring / "init" system'
url='https://github.com/davmac314/dinit'
source=(
  $pkgbase-$pkgver.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz"
  disable_environ_check.patch
  rc.local
  dinit-wrapper
  shutdown-hook
  "$pkgbase-services::git+https://github.com/eweOS/dinit-services.git#tag=${_service_ver}"
)
arch=(x86_64 aarch64 riscv64)
license=(Apache)
makedepends=(make utmps git)
options=(emptydirs)
sha256sums=('25f36f9a311de3e28278637041c9f962d95843f7265c89436c172286748f88e5'
            'feb964fb18dcd691eff4cea2fb6c80cfc8ab883c8c595004bae97905debd63b0'
            '6d6e651bce957f8be540aaa84e5b5185610244fa0bc5b5945ad281be6cc9f2d0'
            '8cf8da69bac027700eac5a10a2094413992268ebd6886b1acb3904df987cc5e7'
            '9869773f5cd14c92d8107721b0ed866fec60e91d6b8a42e419719a8ee623c699'
            'SKIP')

prepare()
{
  cd "$pkgname-$pkgver"
  # Disable LTO
  sed -i 's/-flto//g' configs/mconfig.Linux.sh
}

build()
{
  cd "$pkgbase-$pkgver"
  make all \
    CXXOPTS="-std=c++11 -fno-rtti" \
    SBINDIR="/usr/bin" \
    BUILD_SHUTDOWN=yes \
    SANITIZEOPTS="-fsanitize=address,undefined" \
    USE_UTMPX=1
}

check()
{
  cd "$pkgbase-$pkgver"
  make check
  make check-igr
}

package_dinit()
{
  depends+=(busybox dinit-services)
  cd "$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin install
  install -d ${pkgdir}/etc/dinit.d
  install -Dm0755 ${srcdir}/dinit-wrapper ${pkgdir}/usr/bin/init
}

package_dinit-services()
{
  depends+=(utmps pawprint catnest)
  arch=(any)

  install -d ${pkgdir}/etc/dinit.d/boot.d
  install -d ${pkgdir}/usr/lib/dinit/system/boot.d
  install -d ${pkgdir}/usr/lib/dinit/user/boot.d
  install -d ${pkgdir}/usr/lib/dinit/exec/user
  install -m 0755 rc.local ${pkgdir}/etc/rc.local
  cp ${srcdir}/$pkgname/services/* ${pkgdir}/usr/lib/dinit/system/
  cp ${srcdir}/$pkgname/user-services/* ${pkgdir}/usr/lib/dinit/user/
  cp -r ${srcdir}/$pkgname/exec/* ${pkgdir}/usr/lib/dinit/exec/
  install -d ${pkgdir}/usr/lib/dinit/exec/shutdown
  install -m 0755 shutdown-hook ${pkgdir}/usr/lib/dinit/shutdown-hook
}
