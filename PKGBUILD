# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=semver
pkgver=7.8.6
pkgrel=1
pkgdesc='The semantic version parser used by npm'
arch=('any')
url='https://github.com/npm/node-semver'
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('f65a52494e0c972de6aedaeec0bb3578b2bafa0cdbcea78117044d8c88c4fbd2ee0e959d61cb6b4254377a3d489608bb8249e9b134673e82cff03a421ea1c827')

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
