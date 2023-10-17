# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=minisign
pkgver=0.11
pkgrel=1
pkgdesc="A dead simple tool to sign files and verify digital signatures."
arch=(x86_64 aarch64 riscv64)
url="https://github.com/jedisct1/minisign"
license=('custom:ISC')
depends=('libsodium')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jedisct1/minisign/archive/$pkgver.tar.gz")
sha512sums=('a7445cb9646ae56fcba718f61f73486d5774d9cafe72ef051a3e60f94baf852b597261778bce50371ea5ee63395b0477bf1a33c7683fde32d003fab66029241f')

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
