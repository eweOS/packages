# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gettext-tiny
pkgver=0.3.2
pkgrel=1
pkgdesc="Tiny Internationalized Message Handling Library and tools"
url="https://github.com/sabotage-linux/gettext-tiny"
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(musl)
makedepends=(git)
_commit=86d9b993d0e09d8f8788dcd18c308206a199a82a
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
