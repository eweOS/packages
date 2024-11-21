# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ncmpc
pkgver=0.51
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
sha512sums=('a739f880e94a63d5052722c5fa7ed1c3e77ca0dee8f2fdc7ce1885a6e29e08029159bc4c31ef238f326285e26dbd24083bc0f30f462ee5ba3476fbb9ec61e055')

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
