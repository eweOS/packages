# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=flite
pkgver=2.2
pkgrel=2
pkgdesc="A lightweight speech synthesis engine"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="http://www.festvox.org/flite/"
license=(LicenseRef-Flite)
depends=(alsa-lib)
makedepends=(chrpath git autoconf)
source=(
  "git+https://github.com/festvox/flite#tag=v$pkgver"
  remove-install-flite_time.patch
  eweos-config.patch
)
sha256sums=('2f7873f3de7bb6d6a8368684fd2bacf771260e666966a75535a4c8206424071b'
            'ec5566b5e9562d9ff276294248ead5224b04355eb4915817564746644bb743a8'
            'ef2c4ca7639b3cb082050e7dbd182af046ca2f790790bbb4453d74523032bba2')

prepare() {
  _patch_ $pkgname
  cp $pkgname/config/{android,eweos}.lv

  cp /usr/share/autoconf/build-aux/{config.guess,config.sub,install-sh} $pkgname/
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
