# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ncurses
pkgver=6.5
pkgrel=1
arch=(x86_64 aarch64 riscv64)
license=(MIT-open-group)
pkgdesc="System V Release 4.0 curses emulation library"
url="https://invisible-island.net/ncurses/ncurses.html"

source=(
  "http://ftp.gnu.org/gnu/ncurses/ncurses-${pkgver}.tar.gz"
  https://invisible-mirror.net/archives/ncurses/current/termcap.src.gz
)
sha256sums=('136d91bc269a9a5785e5f9e980bc76ab57428f604ce3e5a5a90cebc767971cc6'
            'e53ce12919e351d46ccd0a8a6ac595764d5bfe9b688b74830a522a3959f3b02d')

build()
{
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
    --enable-widec \
    --enable-pc-files \
    --disable-debug \
    --without-tests \
    --with-cxx-binding \
    --with-cxx-shared \
    --with-shared \
    --without-normal \
    --with-versioned-syms \
    --with-xterm-kbs=del \
    --enable-sigwinch \
    --mandir=/usr/share/man \
    --with-pkg-config-libdir=/usr/lib/pkgconfig
  make
}

package()
{
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver

  for lib in ncurses ncurses++ form panel menu; do
    printf "INPUT(-l%sw)\n" "${lib}" > "$pkgdir/usr/lib/lib${lib}.so"
    ln -sv ${lib}w.pc "$pkgdir/usr/lib/pkgconfig/${lib}.pc"
  done

  printf 'INPUT(-lncursesw)\n' > "$pkgdir/usr/lib/libcursesw.so"
  ln -sv libncurses.so "$pkgdir/usr/lib/libcurses.so"

  for lib in tic tinfo; do
    printf "INPUT(libncursesw.so.%s)\n" "${pkgver:0:1}" > "$pkgdir/usr/lib/lib${lib}.so"
    ln -sv libncursesw.so.${pkgver:0:1} "$pkgdir/usr/lib/lib${lib}.so.${pkgver:0:1}"
    ln -sv ncursesw.pc "$pkgdir/usr/lib/pkgconfig/${lib}.pc"
  done
}
