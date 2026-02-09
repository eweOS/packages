# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=semver
pkgver=7.7.4
pkgrel=1
pkgdesc='The semantic version parser used by npm'
arch=('any')
url='https://github.com/npm/node-semver'
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('bc5282d8812d427561a53efc875629f30cf0adff0233e33328c1c62597c1b738593727111675ec1e4e84e53c4892432c80d4bb99d5f700607bc7640cd9d8b894')

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
