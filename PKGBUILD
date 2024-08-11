# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-setuptools
pkgver=72.2.0
pkgrel=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
groups=(python-build-backend)
url="https://pypi.org/project/setuptools/"
depends=(
  'python' 'python-more-itertools'
  'python-jaraco.text' 'python-platformdirs'
  'python-tomli' 'python-validate-pyproject'
  'python-ordered-set' 'python-packaging')
makedepends=('git' 'python-setuptools')
provides=('python-distribute')
replaces=('python-distribute')
source=("git+https://github.com/pypa/setuptools.git#tag=v$pkgver"
        system-validate-pyproject.patch
        add-dependency.patch
        build-no-isolation.patch)
sha512sums=('0afbc655055c884ed838da6fa116aedea868b3a1933de48a096b988335954f8dd39411f2212f56411c1519efd7dac00a5a2f2ce40dada99fe5608a991544af20'
            '84e78d3fb129f939a046afec3302adfeb7db9f0d7598a519e611572f61602eeb918e13dad62cf37a744757497e43181db4128791a3af302fd00b7f1d37dbcb78'
            'f2dbdf501f1bbcd3b375f3b4930481ee6c3900213192dbd7f272fd93f09f926560cb606cbb8c8dca128d5170b57716948308cd864ab280329049f76564e485f1'
            '1bc856933de9b51f6313f5fc16ee0e96b72b48e5def71fdc568dd6812f3f80b3ad088bf37d0e4be288bec74518c4e1468537a4e178cc7acbb4343b32763c7914')

export SETUPTOOLS_INSTALL_WINDOWS_SPECIFIC_FILES=0

prepare() {
  cd setuptools

  patch -p1 < ../system-validate-pyproject.patch

  rm -r {pkg_resources,setuptools}/{extern,_vendor} setuptools/config/_validate_pyproject

  # Upstream devendoring logic is badly broken, see:
  # https://bugs.archlinux.org/task/58670
  # https://github.com/pypa/pip/issues/5429
  # https://github.com/pypa/setuptools/issues/1383
  # The simplest fix is to simply rewrite import paths to use the canonical
  # location in the first place
  for _module in setuptools pkg_resources '' ; do
      find . -name \*.py -exec sed -i \
          -e 's/from '$_module.extern' import/import/' \
          -e 's/from '$_module.extern'\./from /' \
          -e 's/import '$_module.extern'\./import /' \
          -e "s/__import__('$_module.extern./__import__('/" \
          -e 's/from \.\.extern\./from /' \
          {} +
  done

  # Add the devendored dependencies into metadata of setuptools
  patch -p1 < ../add-dependency.patch

  # Fix tests invoking python-build
  patch -p1 < ../build-no-isolation.patch

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
