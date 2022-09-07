# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=neofetch
pkgver=7.1.0
pkgrel=1
pkgdesc="A CLI system information tool written in BASH that supports displaying images."
arch=('any')
url="https://github.com/dylanaraps/neofetch"
license=('MIT')
depends=('bash')
makedepends=()
_commit="60d07dee6b76769d8c487a40639fb7b5a1a7bc85"
source=(
  https://github.com/dylanaraps/neofetch/archive/${_commit}.tar.gz
  add-eweos.patch
)
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "${pkgname}-${_commit}"
  patch < ${srcdir}/add-eweos.patch
}

package() {
  cd "${pkgname}-${_commit}"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

