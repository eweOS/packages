# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=minisign
pkgver=0.12
pkgrel=1
pkgdesc="A dead simple tool to sign files and verify digital signatures."
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/jedisct1/minisign"
license=('custom:ISC')
depends=('libsodium')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jedisct1/minisign/archive/$pkgver.tar.gz")
sha512sums=('fc95020fef3ae63ab974a20c39b9bf05df957c40838fceb73cb10d6cec9880d882727b6a0240b81b4a7593ff2603d4eef4b32b0857dcf5f85de5e0b7573086ed')

prepare()
{
  mkdir -p build
}

build()
{
  cd build
  cmake ../minisign-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package()
{
  make -C build DESTDIR="$pkgdir" install
  install -Dm644 minisign-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
