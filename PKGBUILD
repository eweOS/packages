# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=argon2
pkgver=20190702
pkgrel=1
pkgdesc='A password-hashing function (reference C implementation)'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://github.com/P-H-C/phc-winner-argon2'
license=('Apache' 'custom:CC0')
provides=('libargon2.so')
source=("https://github.com/P-H-C/phc-winner-argon2/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('daf972a89577f8772602bf2eb38b6a3dd3d922bf5724d45e7f9589b5e830442c')

build() {
  cd "$srcdir/phc-winner-$pkgname-$pkgver"

  make ARGON2_VERSION="${pkgver}" OPTTARGET='none' LIBRARY_REL='lib'
}

check() {
  cd "$srcdir/phc-winner-$pkgname-$pkgver"

  make ARGON2_VERSION="${pkgver}" OPTTARGET='none' LIBRARY_REL='lib' test
}

package() {
  cd "$srcdir/phc-winner-$pkgname-$pkgver"

  make ARGON2_VERSION="${pkgver}" OPTTARGET='none' LIBRARY_REL='lib' DESTDIR="$pkgdir" install

  install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/argon2/LICENSE"
}
