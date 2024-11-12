# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=flite
pkgver=2.2
pkgrel=1
pkgdesc="A lightweight speech synthesis engine"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="http://www.festvox.org/flite/"
license=(LicenseRef-Flite)
depends=(alsa-lib)
makedepends=(chrpath git)
source=(
  "git+https://github.com/festvox/flite#tag=v$pkgver"
  remove-install-flite_time.patch
  eweos-config.patch
)
sha256sums=('2f7873f3de7bb6d6a8368684fd2bacf771260e666966a75535a4c8206424071b' 'SKIP' 'SKIP')

prepare() {
  _patch_ $pkgname
  cp $pkgname/config/{android,eweos}.lv
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --enable-shared \
    --with-audio=alsa \
    --with-vox=cmu_us_kal16 \
    --with-langvox=eweos
  make -j1
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  _install_license_ COPYING

# TODO: Fix rpath
  chrpath -d "$pkgdir"/usr/bin/*
}
