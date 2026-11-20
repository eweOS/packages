# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lmdb
pkgver=1.0.3
pkgrel=1
pkgdesc="Symas Lightning Memory-Mapped Database"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://symas.com/lmdb"
license=('custom:OpenLDAP')
depends=('musl')
makedepends=('git')
options=('!emptydirs')
source=("git+https://git.openldap.org/openldap/openldap.git#tag=LMDB_$pkgver"
        lmdb.pc)
sha512sums=('37dbff163b0827464efa4c289083736c6c8affea03d4fb94e95e9beca077b39c43ac09d54d241bf159aca16f248b0022fca9b6e24c199d54b40679af4e2cc82f'
            '0349d4b08a1f93fe338d8f8e3e5a83e24211a46f999fe529bc1ac49c8c4975559d95a548c203d9427e3f82d62e934ba3cd1be6f734f9b9405b2a26477be4ed33')

prepare() {
  sed -e "s|@PKGVER@|$pkgver|" -i lmdb.pc
}

build() {
  cd openldap/libraries/liblmdb
  make CFLAGS="$CFLAGS" CPPFLAGS="$CPPFLAGS" LDFLAGS="$LDFLAGS" prefix=/usr
}

check() {
  cd openldap/libraries/liblmdb
  make test
}

package() {
  cd openldap/libraries/liblmdb
  install -dm755 "$pkgdir"/usr/{bin,lib,include,man/man1,share}
  make DESTDIR="$pkgdir" prefix=/usr install

  mv "$pkgdir"/usr/man "$pkgdir"/usr/share/man

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 "$srcdir"/lmdb.pc -t "$pkgdir"/usr/lib/pkgconfig/
}
