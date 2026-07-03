# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cryptsetup
pkgver=2.8.6
pkgrel=2
pkgdesc='Userspace setup tool for transparent encryption of block devices using dm-crypt'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL')
url='https://gitlab.com/cryptsetup/cryptsetup'
depends=('device-mapper' 'libdevmapper.so' 'util-linux-libs' 'popt' 'json-c' 'libjson-c.so' 'argon2' 'openssl')
makedepends=('util-linux' 'linux-headers' 'git')
provides=('libcryptsetup.so')
options=('!emptydirs')
# 0001-0003: Backport fixes for keyring leaks
#     https://lore.kernel.org/all/ajKwRtP8izwRsMmv@quasitopos/
#     https://gitlab.com/cryptsetup/cryptsetup/-/work_items/993
source=(
  "https://www.kernel.org/pub/linux/utils/cryptsetup/v${pkgver%.*}/${pkgname}-${pkgver}.tar.xz"
  "0001-BACKPORT-Add-keyring-key-type.patch"
  "0002-BACKPORT-Load-volume-keys-in-intermediary-keyring-li.patch"
  "0003-BACKPORT-Use-unique-intermediary-keyring-name-per-de.patch"
)
sha256sums=(
  '8004265fd993885d08f7b633dbe056851de1a210307613a4ebddc743fccefe5a'
  'fe5498cc7ccddfbb9e0e37e333ada4b033ed6238c53f41cd3da502749949c00b'
  '4f19e92dd1379ac5bbf2fd1f22b255139844350b9a42e96529be3a3d11745149'
  '51cb56e2059758aaebc25eb76d6387f96191ddb34df99eaae69c4258df16b739'
)

prepare() {
  _patch_ $pkgname-$pkgver
}

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
