# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ncmpc
pkgver=0.53
pkgrel=1
pkgdesc="Fully featured MPD client which runs in a terminal"
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://www.musicpd.org/clients/ncmpc/
license=(GPL2)
depends=(
  pcre2
)
makedepends=(
  boost
  fmt
  libmpdclient
  meson
  ncurses
)
optdepends=(
  'python-beautifulsoup4: for lyrics scripts'
  'python-requests: for lyrics scripts'
)
source=("https://www.musicpd.org/download/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha512sums=('8334b122584ca4908e927847d8d41f5a7c729e05fcc72650993461d3dead66ad255e9f674a128af5928a6d1cde4e14b4d1424e058ed7e95852f74d726eb9d71b')

build() {
  ewe-meson -D lyrics_screen=true -D lirc=disabled -D chat_screen=true -D documentation=disabled build "$pkgname-$pkgver"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  depends+=(
    fmt libfmt.so
    libmpdclient libmpdclient.so
    ncurses libncursesw.so
  )

  meson install -C build --destdir "$pkgdir"
}
