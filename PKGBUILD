# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=semver
pkgver=7.7.2
pkgrel=1
pkgdesc='The semantic version parser used by npm'
arch=('any')
url='https://github.com/npm/node-semver'
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('445d05c3eacee4031ff4c0326915c8e005745258f994c1ea571c5d4a08956e2c52097a049a65ff8e4d02b89c38fb74aaae860ef55a1487e1dcb898afbed25e98')

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
