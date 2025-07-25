# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=node-gyp
pkgver=11.2.0
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
sha512sums=('4f44b5ceab245544b172c493900b0b73bc42c9cad1626b431da7438a7ce872b4e18f24029f990c9440528fa1f8a836e0b083922e69a544879bd256578fe500ac')

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

  # Experimental dedup
  rm -r "$pkgdir"/usr/lib/node_modules/$pkgname/node_modules/{,.bin/}nopt
  rm -r "$pkgdir"/usr/lib/node_modules/$pkgname/node_modules/{,.bin/}semver

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
