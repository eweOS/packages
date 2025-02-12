# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=semver
pkgver=7.7.1
pkgrel=1
pkgdesc='The semantic version parser used by npm'
arch=('any')
url='https://github.com/npm/node-semver'
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('865abcb407e7d26ffad69e0155170fcc81abe8b2a2330a3854ce9d1a2ea9b78a9c46498dcd3716aba782123121faa5e390c0ef3e53851521b0423a046ba83230')

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
