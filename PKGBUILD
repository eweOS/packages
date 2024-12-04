# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-setuptools
pkgver=75.6.0
pkgrel=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
groups=(python-build-backend)
url="https://pypi.org/project/setuptools/"
depends=(
  'python'
  'python-jaraco.collections'
  'python-jaraco.functools'
  'python-jaraco.text'
  'python-more-itertools'
  'python-packaging'
  'python-platformdirs'
  'python-wheel'
)
makedepends=('git' 'python-setuptools')
provides=('python-distribute')
replaces=('python-distribute')
source=("git+https://github.com/pypa/setuptools.git#tag=v$pkgver"
        build-no-isolation.patch)
sha512sums=('1aa3d43e50d7e27772c0623c0255d5da9a4a8e08847145fdcd9d6c6b2c9f28d3b38fc25198c9596c4dff96756309bc844713ecb34fd2e12cc987b60f7c70fc24'
            '701b4364736344951d945df624f58973dfbca56eeda708aeed928df10f5598509e3acf87074ab30d84bb652fc8e307157184bfe43bb81ee83159966430c58e51')

export SETUPTOOLS_INSTALL_WINDOWS_SPECIFIC_FILES=0

prepare() {
  cd setuptools

  # Populate dependencies list for devendored deps
  sed '/^core =/,/]/!d' pyproject.toml > ../requirements.txt
  sed -i '1d;$d' ../requirements.txt
  sed -i '/^dependencies =/ {
  r ../requirements.txt
  s/^core =/dependencies =/
  }' pyproject.toml

  # Keep validate-pyproject as it also includes the generated validations
  rm -r setuptools/_vendor

  # Fix tests invoking python-build
  patch -p1 -i ../build-no-isolation.patch

  # Remove post-release tag since we are using stable tags
  sed -e '/tag_build = .post/d' \
    -e '/tag_date = 1/d' \
    -i setup.cfg
}

build() {
  cd setuptools
  python setup.py build
}

package() {
  cd setuptools
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
