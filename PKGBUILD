# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=tmux
pkgver=3.3_a
pkgrel=2
pkgdesc='A terminal multiplexer'
url='https://github.com/tmux/tmux/wiki'
arch=(x86_64 aarch64)
license=('BSD')
depends=('ncurses' 'libevent')
source=("https://github.com/tmux/tmux/releases/download/${pkgver/_/}/tmux-${pkgver/_/}.tar.gz")
sha256sums=('SKIP')

build()
{
  cd "$pkgname-${pkgver/_/}"

  ./configure \
    --prefix=/usr
  #--enable-utempter # waiting for utempter package
  make
}

package()
{
  cd "$pkgname-${pkgver/_/}"

  make install DESTDIR="$pkgdir"
  install -D -m0644 COPYING "$pkgdir/usr/share/licenses/tmux/LICENSE"
  install -D -m644 example_tmux.conf \
    "$pkgdir"/usr/share/doc/$pkgname/examples/$pkgname.conf
  local file
  for file in CHANGES README; do
    install -m644 "$file" "$pkgdir"/usr/share/doc/$pkgname/
  done
}
