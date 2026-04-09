# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libsodium
pkgver=1.0.21
pkgrel=1
pkgdesc="Portable & Packageable NaCl-based crypto library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/jedisct1/libsodium"
license=('custom:ISC')
provides=('libsodium.so')
source=("https://download.libsodium.org/libsodium/releases/libsodium-$pkgver.tar.gz")
sha512sums=('ee8cc2f3f5707b172bf75d8c04afbd5f0c83c6f94dbab3f988f07aab716d96f1662556a59e09b3d83c3bd5c22f59327ad95937bf499d523c86146f4df830f777')

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
