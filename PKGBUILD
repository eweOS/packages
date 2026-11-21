# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nspr
pkgver=4.41
pkgrel=1
pkgdesc="Netscape Portable Runtime"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSPR"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MPL-2.0)
makedepends=(git autoconf)
source=("git+https://github.com/mozilla/nspr#tag=NSPR_${pkgver//./_}_RTM")
sha256sums=('81360861fcd1a80a933da6e0a63ff8fe947bd26008a2e34a14245836c4c61e88')

prepare() {
  cd nspr
  autoreconf -fiv
}

build() {
  cd nspr

  # nspr doesn't detect musl-libc correctly, related-issues
  # https://bugzilla.mozilla.org/show_bug.cgi?id=700953
  # Pass -D_PR_POLL_AVAILABLE to ensure poll(2), instead of select(2), is used.
  # Usage of the latter violates the sandbox policy of FIrefox.
  CFLAGS="$CFLAGS -D_PR_POLL_AVAILABLE" \
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
  make -C pr/tests
}

check() {
  cd nspr
  make -C pr/tests runtests
}

package() {
  cd nspr
  make DESTDIR="$pkgdir" install
  _install_license_ LICENSE

  ln -s nspr.pc "$pkgdir/usr/lib/pkgconfig/mozilla-nspr.pc"

  rm -r "$pkgdir"/usr/include/nspr/md
  rm "$pkgdir"/usr/bin/{compile-et.pl,prerr.properties}
}
