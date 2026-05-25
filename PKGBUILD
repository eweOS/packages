# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libsodium
pkgver=1.0.22
pkgrel=1
pkgdesc="Portable & Packageable NaCl-based crypto library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/jedisct1/libsodium"
license=('custom:ISC')
provides=('libsodium.so')
source=("https://download.libsodium.org/libsodium/releases/libsodium-$pkgver.tar.gz")
sha512sums=('8f392de781f09578d9a32000a4198e8d199ab910743017af3b3c5cae8053f745bcc885a9417fcaffb03b832400d829aef3a93c065bbb77b92598d882b6dcf187')

prepare()
{
  cd "$pkgname-$pkgver"
  sed -i 's/have_armcrypto=yes/have_armcrypto=no/' configure.ac
  autoreconf -fiv
}

build()
{
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check()
{
  cd "$pkgname-$pkgver"
  make check
}

package()
{
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # install license
  install -d -m 755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
