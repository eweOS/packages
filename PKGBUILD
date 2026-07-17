# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=dinit
pkgver=0.22.1
pkgrel=1
pkgdesc='Service monitoring / "init" system'
url='https://github.com/davmac314/dinit'
source=(
  $pkgname-$pkgver.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "path-transition.patch"
)
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
makedepends=(make linux-uapi-headers)
depends=(busybox musl llvm-libs libcap)
optdepends=('dinit-services: dinit service files')
options=(emptydirs)
sha256sums=('8907d4f668259c4f66d9d2c7cbbb55d455c28dc433596ab29005d589cb572e1e'
            '22052127397bf6322f421fe891b8eec5484f24554aef805b4fb18aa32ccbb722')

prepare() {
  _patch_ "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  make all \
    SBINDIR="/usr/bin" \
    LDFLAGS_BASE="$LDFLAGS" \
    BUILD_SHUTDOWN=yes \
    USE_UTMPX=1
}

check() {
  cd "$pkgname-$pkgver"
  make check
  make check-igr
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin install
  install -d ${pkgdir}/etc/dinit.d
  ln -s dinit ${pkgdir}/usr/bin/init
}
