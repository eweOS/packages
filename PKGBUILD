# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkgname=hyfetch
pkgname=neofetch
pkgver=7.3.11
pkgrel=1
pkgdesc="A CLI system information tool written in BASH that supports displaying images."
arch=('any')
url="https://github.com/hykilpikonna/hyfetch"
license=('MIT')
depends=('bash' 'python')
source=(
  $url/archive/refs/tags/$pkgname-$pkgver.tar.gz
  add-eweos.patch
)
sha256sums=('5193028dce77b3520c6e98f58dc7342249bbb9ffe9e1c2e0bf3eb3073d482bc7'
            'cdbaf646ecef1ef66ebdb641b6bd8e4a42c7f3db70f765896d0409e2a0382727')

prepare() {
  _patch_ "$_pkgname-$pkgname-$pkgver"
}

package() {
  cd "$_pkgname-$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install-neofetch
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

