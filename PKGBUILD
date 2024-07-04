# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=pcre
pkgver=8.45
pkgrel=3
pkgdesc='A library that implements Perl 5-style regular expressions'
arch=(x86_64 aarch64 riscv64)
url='https://www.pcre.org/'
license=('BSD')
depends=('llvm-libs' 'readline' 'zlib' 'libbz2')
options=(staticlibs)
provides=(libpcreposix.so libpcrecpp.so libpcre32.so libpcre16.so libpcre.so)
source=(https://sourceforge.net/projects/pcre/files/pcre/$pkgver/pcre-$pkgver.tar.bz2)
sha512sums=('91bff52eed4a2dfc3f3bfdc9c672b88e7e2ffcf3c4b121540af8a4ae8c1ce05178430aa6b8000658b9bb7b4252239357250890e20ceb84b79cdfcde05154061a')

prepare()
{
  cd $pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      msg2 "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  :
}

build()
{
  # No JIT support for riscv64
  case $CARCH in
    riscv64)	JIT_OPTIONS=(--disable-jit) ;;
    *)		JIT_OPTIONS=(--enable-jit) ;;
  esac
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --enable-unicode-properties \
    --enable-pcre16 \
    --enable-pcre32 \
    ${JIT_OPTIONS[*]} \
    --enable-pcregrep-libz \
    --enable-pcregrep-libbz2 \
    --enable-pcretest-libreadline
  make
}

check()
{
  cd $pkgname-$pkgver
  make -j1 check
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
