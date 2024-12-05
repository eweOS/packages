# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ladspa
pkgver=1.17
pkgrel=1
pkgdesc="Linux Audio Developer's Simple Plugin API (LADSPA)"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1)
url="https://www.ladspa.org/"
makedepends=(libsndfile)
optdepends=('libsndfile: for applyplugin')
source=(
  https://ladspa.org/download/ladspa_sdk_$pkgver.tgz
  $pkgname-1.17-plugin_underlinking.patch
  fix-memleak-in-plugin-scanning.patch
)
sha512sums=('c096e70d245c50ffad379f2c9aab2735c205dfe7c27b5710cad6e43b39f8accc7b8bd2cd7ebbea2c399ad76018b3d4c701ed271de552d098b12ab218a58f0497'
            '9660937df8cfcd2005f8e6b4d7257a6d295a2d7e06979dd05ff2894461e91fc3f812497878673724ee9209bffd67fbb690fbdc3669ecb5932503d0770454301b'
            'e80a575e6afe42f9d0ac1234a7832a29fb9362c7ab7b2d6b14cc3e6da6a9ba67af886cf09f1c0b78c161205084f705049fb4dc22fe2795efaeb7d94da90dc93e')

prepare() {
  cd ${pkgname}_sdk_$pkgver
  patch -Np0 -i "../fix-memleak-in-plugin-scanning.patch"
  # fix underlinking of plugins
  patch -Np1 -i ../$pkgname-1.17-plugin_underlinking.patch
  # add LDFLAGS for full RELRO
  sed -e "s#-O2#${CFLAGS} ${LDFLAGS}#" -i src/Makefile
}

build() {
  make -C ${pkgname}_sdk_$pkgver/src
}

package() {
  local make_options=(
    INSTALL_PLUGINS_DIR="$pkgdir/usr/lib/ladspa/"
    INSTALL_INCLUDE_DIR="$pkgdir/usr/include/"
    INSTALL_BINARY_DIR="$pkgdir/usr/bin/"
    install
    -C ${pkgname}_sdk_$pkgver/src
  )
  make "${make_options[@]}"
  install -vDm 644 ${pkgname}_sdk_$pkgver/doc/*.{html,txt} -t "$pkgdir/usr/share/doc/$pkgname"
}

