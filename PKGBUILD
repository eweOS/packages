# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ncmpc
pkgver=0.54
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
sha512sums=('54ce46988198b5c0a9c14b341bc9b5d0a1fdef97532c89ca0bfc9b95eb954dca954f0b8d973b5697feb4146d80c536c2d64b7e54ff53a48987c532ae31c833ac')

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
