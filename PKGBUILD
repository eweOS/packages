# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gyp
pkgver=20230914.a03d7413
pkgrel=1
pkgdesc='"Generate Your Projects" Meta-Build system'
url="https://gyp.gsrc.io/"
arch=(any)
license=(custom:BSD)
depends=(python-six ninja)
makedepends=(git python-setuptools git)
_commit=a03d7413becefc8d55c8aa3df58b55b9bd0e9052  # changes/05/4858505/3
source=("git+https://chromium.googlesource.com/external/gyp#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd gyp
  # Commit date + short rev
  echo $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd gyp
  python setup.py build
}

package() {
  cd gyp
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}
