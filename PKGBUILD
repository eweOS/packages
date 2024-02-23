# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libsodium
pkgver=1.0.19
pkgrel=2
pkgdesc="Portable & Packageable NaCl-based crypto library"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/jedisct1/libsodium"
license=('custom:ISC')
source=("https://download.libsodium.org/libsodium/releases/libsodium-$pkgver.tar.gz")
sha512sums=('8e9b6d796f6330e00921ce37f1b43545966094250938626ae227deef5fd1279f2fc18b5cd55e23484732a27df4d919cf0d2f07b9c2f1aa0c0ef689e668b0d439')

prepare()
{
  cd "$pkgname-stable"
  sed -i 's/have_armcrypto=yes/have_armcrypto=no/' configure.ac
  autoreconf -fiv
}

build()
{
  cd "$pkgname-stable"
  ./configure --prefix=/usr
  make
}

check()
{
  cd "$pkgname-stable"
  make check
}

package()
{
  cd "$pkgname-stable"
  make DESTDIR="$pkgdir" install

  # install license
  install -d -m 755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
