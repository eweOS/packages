# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>

pkgname=libssh2
pkgver=1.11.1
pkgrel=1
pkgdesc="A library implementing the SSH2 protocol as defined by Internet Drafts"
url="https://www.libssh2.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('BSD')
depends=('openssl' 'zlib')
provides=('libssh2.so')
source=("https://www.libssh2.org/download/$pkgname-$pkgver.tar.gz")
sha256sums=('d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7')

build()
{
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr	\
	  --disable-docker-tests
  make
}

check()
{
  make -C "$pkgname-$pkgver" check
}

package()
{
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
