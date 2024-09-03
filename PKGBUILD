# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gettext-tiny
pkgver=0.3.2
pkgrel=2
pkgdesc="Tiny Internationalized Message Handling Library and tools"
url="https://github.com/sabotage-linux/gettext-tiny"
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(musl)
makedepends=(git)
_commit=d58fc972ac44670d547d74bfcd05fbbe2ecd7e5c
source=("git+$url.git#commit=$_commit" fix-plural.patch bind_textdomain_codeset.patch)
sha256sums=('6e5440d50c6cb1a67e70fa5e8c914fe6cd1e8801cd8c86b93c1127c59e6aaa1c'
            '6a7693746a24028133d786e69ba89b3c6b2cbdb91571fdecbfdbfb716ca12c27'
            '903cf4baf3ad65371263e921374e2a69d3a82174515b599a85f6ba35e59a2f61')

pkgver() {
  cd $pkgname
  printf "$pkgver.r%s.%s.%s" "$(git rev-list --count v$pkgver..HEAD)" "$(git rev-parse --short HEAD)" "$pkgrel"
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
