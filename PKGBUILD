# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ncurses
pkgver=6.4
pkgrel=1
arch=(x86_64 aarch64 riscv64)
license=(GPL2)
pkgdesc="System V Release 4.0 curses emulation library"
url="https://invisible-island.net/ncurses/ncurses.html"

source=(
  "http://ftp.gnu.org/gnu/ncurses/ncurses-${pkgver}.tar.gz"
  https://invisible-mirror.net/archives/ncurses/current/termcap.src.gz
)
sha256sums=('6931283d9ac87c5073f30b6290c4c75f21632bb4fc3603ac8100812bed248159'
  '11007fdad0867408cd14b93ec4ec4eb4f39370bbf0520957c9826db4fa6d66fd')

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
