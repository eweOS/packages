# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nspr
pkgver=4.35
pkgrel=3
pkgdesc="Netscape Portable Runtime"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSPR"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MPL GPL)
makedepends=(mercurial autoconf)
_revision=b563bfc16c887c48b038b7b441fcc4e40a126d3b
source=("hg+https://hg.mozilla.org/projects/nspr#revision=$_revision")
sha256sums=('SKIP')

pkgver() {
  cd nspr
  hg id -t -r. | sed 's/^NSPR_//;s/_RTM$//;s/_/./g'
}

prepare() {
  cd nspr
  autoreconf -fiv
}

build() {
  cd nspr
  ./configure \
      --prefix=/usr \
      --libdir=/usr/lib \
      --includedir=/usr/include/nspr \
      --enable-optimize \
      --disable-debug \
      --enable-64bit
  make ${SOURCE_DATE_EPOCH:+
    SH_NOW="${SOURCE_DATE_EPOCH}000000"
    SH_DATE="$(date --utc --date="@$SOURCE_DATE_EPOCH" '+%Y-%m-%d %T')"
  }
}

package() {
  cd nspr
  make DESTDIR="$pkgdir" install
  ln -s nspr.pc "$pkgdir/usr/lib/pkgconfig/mozilla-nspr.pc"

  rm -r "$pkgdir"/usr/include/nspr/md
  rm "$pkgdir"/usr/bin/{compile-et.pl,prerr.properties}
}
