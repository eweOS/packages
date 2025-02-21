# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ncmpc
pkgver=0.52
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
sha512sums=('bc3eaef9e1d8e760578fbcc10f26a62cafc6d94ceed07457ffc7cacdc2f49c13910acd8265b5b574d295cd54c4c7b391a2824493ea47967a2702c908e415c17d')

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
