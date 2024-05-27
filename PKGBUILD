# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libsodium
pkgver=1.0.20
pkgrel=1
pkgdesc="Portable & Packageable NaCl-based crypto library"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/jedisct1/libsodium"
license=('custom:ISC')
provides=('libsodium.so')
source=("https://download.libsodium.org/libsodium/releases/libsodium-$pkgver.tar.gz")
sha512sums=('7ea165f3c1b1609790e30a16348b9dfdc5731302da00c07c65e125c8ab115c75419a5631876973600f8a4b560ca2c8267001770b68f2eb3eebc9ba095d312702')

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
