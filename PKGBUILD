# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=stb
pkgver=r2216.f1c79c0
pkgrel=1
pkgdesc='Single-file public domain (or MIT licensed) libraries for C/C++'
arch=(any)
url=https://github.com/nothings/stb
license=(MIT)
makedepends=(git)
_commit=f1c79c02822848a9bed4315b12c8c8f3761e1296
source=(git+https://github.com/nothings/stb.git#commit=${_commit})
sha256sums=('55ffc884e4185eb0e409edce23ae8bcda8b73321abaf5c695904470c3e65ef49')

pkgver() {
  cd stb
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  install -Dm 644 stb/*.{c,h} -t "${pkgdir}"/usr/include/stb/
  _install_license_ stb/LICENSE
}
