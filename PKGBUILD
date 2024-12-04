# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-tqdm
pkgver=4.66.6
pkgrel=2
pkgdesc='Fast, Extensible Progress Meter'
arch=('any')
license=('MIT' 'MPL-2.0')
url='https://github.com/tqdm/tqdm'
depends=('python')
optdepends=('python-requests: telegram')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'python-toml')
source=("git+https://github.com/tqdm/tqdm.git#tag=v${pkgver}")
sha512sums=('27d6d13099dd6b3f91fce3d2117838967377f67e8234e7f0253be529ed1077997bb7adb1b5295d8cdf3b83133090cdc32537d15f7b5a7cb1a92399dc0150d424')

build() {
  cd tqdm
  python -m build --wheel --no-isolation
}

package() {
  cd tqdm
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
  install -Dm 644 tqdm/completion.sh "${pkgdir}/usr/share/bash-completion/completions/tqdm"
}
