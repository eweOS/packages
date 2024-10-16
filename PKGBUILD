# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=node-gyp
pkgver=10.2.0
pkgrel=1
pkgdesc='Node.js native addon build tool'
arch=('any')
url='https://github.com/nodejs/node-gyp'
license=('MIT')
depends=('nodejs' 'nodejs-nopt' 'semver')
makedepends=('npm')
optdepends=('clang: to build C++ modules'
            'make: to build C++ modules'
            'python: to build C++ modules')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('b29dc5a270406857b86984dc15d6549f635891b3fbc6ba0f198bd098fe0d9793f16a6ce722d067342823ad54caac47d0ca722732c26f66b766a949f2b0227caf')

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

  # Experimental dedup
  rm -r "$pkgdir"/usr/lib/node_modules/$pkgname/node_modules/{,.bin/}nopt
  rm -r "$pkgdir"/usr/lib/node_modules/$pkgname/node_modules/{,.bin/}semver

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
