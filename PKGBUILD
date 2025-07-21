# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cryptsetup
pkgver=2.8.0
pkgrel=1
pkgdesc='Userspace setup tool for transparent encryption of block devices using dm-crypt'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL')
url='https://gitlab.com/cryptsetup/cryptsetup'
depends=('device-mapper' 'libdevmapper.so' 'util-linux-libs' 'popt' 'json-c' 'libjson-c.so' 'argon2' 'openssl')
makedepends=('util-linux' 'linux-headers' 'git')
provides=('libcryptsetup.so')
options=('!emptydirs')
source=("https://www.kernel.org/pub/linux/utils/cryptsetup/v${pkgver%.*}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('cc9e2d37c25a871cea37520b28d532207b0c1670fb10fc54d68071f63f5243a2')

build() {
  cd $pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --enable-libargon2 \
    --disable-ssh-token \
    --disable-static \
    --disable-asciidoc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  # install docs
  install -D -m0644 -t "${pkgdir}"/usr/share/doc/cryptsetup/ FAQ.md docs/{Keyring,LUKS2-locking}.txt
}
