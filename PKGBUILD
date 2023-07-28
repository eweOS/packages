# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=libsodium
pkgver=1.0.18
pkgrel=2
pkgdesc="Portable & Packageable NaCl-based crypto library"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/jedisct1/libsodium"
license=('custom:ISC')
depends=('musl')
source=("https://download.libsodium.org/libsodium/releases/libsodium-$pkgver.tar.gz")
sha512sums=('17e8638e46d8f6f7d024fe5559eccf2b8baf23e143fadd472a7d29d228b186d86686a5e6920385fe2020729119a5f12f989c3a782afbd05a8db4819bb18666ef')

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
