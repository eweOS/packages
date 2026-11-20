# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=namcap
pkgver=3.6.0
pkgrel=1
pkgdesc='A Pacman package analyzer'
arch=(any)
url="https://gitlab.archlinux.org/pacman/$pkgname"
license=(GPL-2.0-or-later)
depends=(licenses
         pkgconf
         pyalpm
         python
         python-license-expression
         python-pyelftools)
checkdepends=(python-pytest)
makedepends=(python-build python-installer python-wheel python-setuptools)
_commit=68113dcd4cf21b97735b5b6350d9018487981ead
_archive="$pkgname-$_commit"
source=("$pkgname-$pkgver.tar.gz::https://github.com/eweOS/$pkgname/archive/$_commit.tar.gz")
sha256sums=('c259a1292a184236fc5699b20cfadf866542cb41067f1b16e9ba374cbaf50c9c')

build() {
  cd "$_archive"
  python -m build -wn
}

check() {
  cd "$_archive"
  env PARSE_PKGBUILD_PATH="$PWD" PATH="$PWD/scripts:$PATH" pytest
}

package() {
  cd "$_archive"
  python -m installer -d "$pkgdir" dist/*.whl
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
  mv "$pkgdir/"{"$site_packages/usr/share",usr}
  rmdir "$pkgdir/$site_packages/usr"
}
