# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=pigz
pkgver=2.8
pkgrel=1
pkgdesc='Parallel implementation of the gzip file compressor'
arch=(x86_64 aarch64 riscv64)
url='https://www.zlib.net/pigz'
license=('custom')
depends=('zlib' 'musl')
source=(https://www.zlib.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('ae3d9d593e1645d65f9ab77aa828600c9af4bb30d0a073da7ae3dd805e65b87efaf6a0efb980f2d0168e475ae506eba194547d6479956dabb9d88293a9078a7f')

build()
{
  cd $pkgname-$pkgver
  make pigz
}

check()
(
  cd $pkgname-$pkgver
  make test
)

package()
{
  cd $pkgname-$pkgver
  for i in pigz unpigz; do
    install -Dm755 $i -t "$pkgdir"/usr/bin
  done
  install -Dm644 pigz.1 -t "$pkgdir"/usr/share/man/man1
  install -Dm644 README "$pkgdir"/usr/share/licenses/$pkgname/README
}
