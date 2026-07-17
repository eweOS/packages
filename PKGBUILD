# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=semver
pkgver=7.8.5
pkgrel=1
pkgdesc='The semantic version parser used by npm'
arch=('any')
url='https://github.com/npm/node-semver'
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('63bfca0ec6fc2e3a28669c1aa86cae94ee8342592c8029dc7211c693eb19218e1206f52870c044147e54af57c8e1d57e26f974c3a723bee71a222e34a6e462a0')

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
