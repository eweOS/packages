# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libao
pkgver=1.2.2
pkgrel=1
pkgdesc="Cross-platform audio output library and plugins"
url="https://xiph.org/ao/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL2)
makedepends=(alsa-lib libpulse)
provides=(libao.so)
backup=(etc/$pkgname.conf)
source=(
  https://gitlab.xiph.org/xiph/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz
  $pkgname.conf
  nanosleep.patch
)
sha512sums=('d2736d25b60862e7d7469611ce31b1df40a4366ab160e2ff1b46919ae91692d1596c8468e4f016303b306fc3ac1bddc7b727f535a362f403c3fe7c6532e9045a'
            'f50d23993eeab4786e68edec88665783a697c141e8f26d38edbe4deb1c760ec690741c70f39e1ec5edaf07ce18216709ea8c23bd622543796248408ce32e53c4'
            '99e238695317240c827ba4be0bc3c9813c51836b8cd070afee6423a5e64de206342482ebe673049da93523e2dd56a4b1642f208e75f57db901cdd09a2dd1c866')

prepare() {
  _patch_ $pkgname-$pkgver
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --enable-alsa-mmap
  )

  cd $pkgname-$pkgver
  ./configure "${configure_options[@]}"
  make
}

package() {
  depends+=(
    alsa-lib
    libpulse
  )

  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  # default config
  install -vDm 644 ../$pkgname.conf -t "$pkgdir/etc/"
  install -vDm 644 {AUTHORS,CHANGES,HACKING,README,TODO} -t "$pkgdir/usr/share/doc/$pkgname/"
}
