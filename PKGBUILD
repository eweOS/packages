# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=pnpm
pkgver=11.21.0
pkgrel=1
pkgdesc='Fast, disk space efficient package manager'
arch=(any)
url=https://pnpm.io
license=(MIT)
depends=(nodejs nodejs-nopt node-gyp semver)
makedepends=(npm)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha256sums=(87237d37eadb79dc626a0576eb3a52d23d70422c323ae5e00fc05c91f4323780)

prepare() {
  cd package
  rm -r artifacts dist/{node-gyp-bin,vendor}
  rm -r dist/node_modules/{node-gyp,nopt,semver}
}

package() {
  cd package
  npm install -g --prefix "$pkgdir"/usr --install-links
  _install_license_ LICENSE
}
