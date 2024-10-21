# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgname=libverto
pkgver=0.3.2
pkgrel=6
pkgdesc="Main event loop abstraction library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/latchset/libverto"
license=(MIT)
depends=('libevent')
makedepends=('autoconf')
provides=('libverto.so' 'libverto-libevent.so' 'libverto-module-base')
conflicts=("krb5<1.19.3-2" "libverto-libevent<0.3.2-4")
replaces=("libverto-libevent<0.3.2-4")
source=("https://github.com/latchset/libverto/releases/download/$pkgver/libverto-$pkgver.tar.gz")
sha256sums=('8d1756fd704f147549f606cd987050fb94b0b1ff621ea6aa4d6bf0b74450468a')

prepare()
{
  cd "$pkgname-$pkgver"
  autoreconf -fiv
}

build()
{
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
    --disable-static \
    --with-libevent \
    --without-libev \
    --without-glib
  make
}

check()
{
  cd "$pkgname-$pkgver"
  make check
}

package_libverto()
{
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm0644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
