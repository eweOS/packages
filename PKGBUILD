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
_commit=d58fc972ac44670d547d74bfcd05fbbe2ecd7e5c
source=("git+$url.git#commit=$_commit" fix-plural.patch)
sha256sums=('SKIP'
            '6a7693746a24028133d786e69ba89b3c6b2cbdb91571fdecbfdbfb716ca12c27')

pkgver() {
  cd $pkgname
  printf "$pkgver.r%s.%s" "$(git rev-list --count v$pkgver..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  _patch_ $pkgname
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
