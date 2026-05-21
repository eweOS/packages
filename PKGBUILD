# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=node-gyp
pkgver=12.2.0
pkgrel=2
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
sha512sums=('ab6dd6773ad0bf8f0aa335e5af4535bfd7703bf939f4d1de4b39fa96819c6acc9fd149d2aedcecf2447133e99fc0949fd03917d2ce3785caa09d23b8fd536d85')

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

  # Experimental dedup
  rm -r "$pkgdir"/usr/lib/node_modules/$pkgname/node_modules/{,.bin/}nopt
  rm -r "$pkgdir"/usr/lib/node_modules/$pkgname/node_modules/{,.bin/}semver

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
