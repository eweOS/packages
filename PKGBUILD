# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ncmpc
pkgver=0.49
pkgrel=1
pkgdesc="Fully featured MPD client which runs in a terminal"
arch=(x86_64 aarch64 riscv64)
url=https://www.musicpd.org/clients/ncmpc/
license=(GPL2)
depends=(
  pcre2
)
makedepends=(
  boost
  libmpdclient
  meson
  ncurses
)
optdepends=(
  'python-beautifulsoup4: for lyrics scripts'
  'python-requests: for lyrics scripts'
)
source=("https://www.musicpd.org/download/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha512sums=('9913f08d90b229af59c8da0ac737445661dc69f0174f996dedbd0c9d9c4833004dbd9319f6bc08dc8b35a191ae167c090a3f31b43167e1918c5fad8f044a4c17')

build() {
  ewe-meson -D lyrics_screen=true -D lirc=disabled -D chat_screen=true -D documentation=disabled build "$pkgname-$pkgver"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  depends+=(
    libmpdclient libmpdclient.so
    ncurses libncursesw.so
  )

  meson install -C build --destdir "$pkgdir"
}
