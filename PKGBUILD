# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gettext-tiny
pkgver=0.3.3
pkgrel=2
pkgdesc="Tiny Internationalized Message Handling Library and tools"
url="https://github.com/sabotage-linux/gettext-tiny"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
makedepends=(git)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('d26769d060412db1c47596fca1e6c1188d10c07b672c69330221dac3cac23404')

build() {
  cd $pkgname
  make LIBINTL=MUSL prefix=/usr
}

package() {
  provides+=(gettext)
  conflicts+=(gettext)
  replaces+=(gettext)

  cd $pkgname
  make LIBINTL=MUSL prefix=/usr DESTDIR="$pkgdir" install
}
