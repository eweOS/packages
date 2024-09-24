# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=dinit
pkgver=0.19.0
pkgrel=2
pkgdesc='Service monitoring / "init" system'
url='https://github.com/davmac314/dinit'
source=(
  $pkgname-$pkgver.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "path-transition.patch"
)
arch=(x86_64 aarch64 riscv64)
license=(Apache)
makedepends=(make git)
depends=(busybox)
optdepends=('dinit-services: dinit service files')
options=(emptydirs)
sha256sums=('64f4241a6ea92de2e9cb0ba8f63e1b3460fbe0d682fe97efc2046949146cde77'
            'a792613ec687eace3aac2073875dd6ff55aba78b2ac97a4858579c410a63dfc5')

prepare()
{
  _patch_ "$pkgname-$pkgver"
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
  ln -s dinit ${pkgdir}/usr/bin/init
}
