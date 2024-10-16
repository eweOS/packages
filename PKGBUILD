# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=semver
pkgver=7.6.3
pkgrel=1
pkgdesc='The semantic version parser used by npm'
arch=('any')
url='https://github.com/npm/node-semver'
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('a157a43f570ab48f824c3bc759815470cb6c2bfd34c260047f2a8a7cd740466f2ed7035585281a5fb03c77852e225508e5ef38884c0e86ced93d8466cd4f54e8')

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
