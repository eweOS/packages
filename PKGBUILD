# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=giflib
pkgver=5.2.2
pkgrel=1
pkgdesc='Library for reading and writing gif images'
url='http://giflib.sourceforge.net/'
arch=(x86_64 aarch64 riscv64)
license=('MIT')
provides=('libgif.so')
makedepends=('xmlto' 'docbook-xml' 'docbook-xsl')
source=(https://downloads.sourceforge.net/project/giflib/${pkgname}-${pkgver}.tar.gz
        giflib-5.1.9-fix-missing-quantize-API-symbols.patch
        giflib-5.1.9-make-flags.patch)
sha512sums=('0865ab2b1904fa14640c655fdb14bb54244ad18a66e358565c00287875d00912343f9be8bfac7658cc0146200d626f7ec9160d7a339f20ba3be6b9941d73975f'
            '5de1e8724f5221fa3637b4e6a482f650f7608673e2c9200233290018ec8a0bf1beea049b3979b5f57dbf2b2a5fda409324e636e9af10582fd01c71d92d4de3b3'
            '8b8d6f483a18467bf6ad169fec04f9ef61534d3e25e1714d39231620142e64672dc336b347b02c8f74172b30e94b104edc83619b8e156ad18a4af521f65d1e31')
options=(!zipman)

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 < ../giflib-5.1.9-fix-missing-quantize-API-symbols.patch
  patch -Np1 < ../giflib-5.1.9-make-flags.patch
  sed -e 's|giflib.xml|giflib.7|' -re 's|doc/(.*).xml|doc/\1.1|g' -i Makefile # Install the actual man pages instead of the sources
  # FIXME: imagemagick
  sed -i 's|convert $^ -resize 50x50 $@|cp $^ $@|' doc/Makefile
  # fix busybox head command
  sed -i 's/--bytes=-20/-c -20/' tests/makefile
}

build() {
  cd ${pkgname}-${pkgver}
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
# Fix giflib man page installation
  install -d "$pkgdir"/usr/share/man/man7
  mv "$pkgdir"/usr/share/man/man{1/giflib.7,7} 
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
