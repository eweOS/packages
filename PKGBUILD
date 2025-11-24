# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=semver
pkgver=7.7.3
pkgrel=1
pkgdesc='The semantic version parser used by npm'
arch=('any')
url='https://github.com/npm/node-semver'
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('49db0a32b23d4dd823770794491f4cc1e1c0e0427c6311e7f0315a0e2b2f85595439ee01175b4b0fb1808f4948a96565f9d3dbfeb131af406d6f2e65a109b6d1')

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
