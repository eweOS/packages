# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=dinit
pkgver=0.18.0
pkgrel=1
pkgdesc='Service monitoring / "init" system'
url='https://github.com/davmac314/dinit'
source=(
  $pkgname-$pkgver.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz"
  disable_environ_check.patch
  dinit-wrapper
)
arch=(x86_64 aarch64 riscv64)
license=(Apache)
makedepends=(make git)
depends=(busybox)
optdepends=('dinit-services: dinit service files')
options=(emptydirs)
sha256sums=('ec854903e93416b3f65e72009dcde4965869d8793e2314565484d94ede534e48'
            'feb964fb18dcd691eff4cea2fb6c80cfc8ab883c8c595004bae97905debd63b0'
            '8cf8da69bac027700eac5a10a2094413992268ebd6886b1acb3904df987cc5e7')

prepare()
{
  cd "$pkgname-$pkgver"
  # Disable LTO
  sed -i 's/-flto//g' configs/mconfig.Linux.sh
}

build()
{
  cd "$pkgname-$pkgver"
  make all \
    CXXOPTS="-std=c++11 -fno-rtti" \
    SBINDIR="/usr/bin" \
    BUILD_SHUTDOWN=yes \
    SANITIZEOPTS="-fsanitize=address,undefined" \
    USE_UTMPX=1
}

check()
{
  cd "$pkgname-$pkgver"
  make check
  make check-igr
}

package()
{
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin install
  install -d ${pkgdir}/etc/dinit.d
  install -Dm0755 ${srcdir}/dinit-wrapper ${pkgdir}/usr/bin/init
}
