# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=hyfetch
pkgname=(hyfetch neowofetch)
pkgver=1.99.0
pkgrel=2
pkgdesc="Neofetch with LGBTQ+ pride flags!"
arch=('any')
url='https://github.com/hykilpikonna/hyfetch'
license=('MIT')
makedepends=('python-setuptools' 'python-typing_extensions')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c712a11a354b34a86c86e7b080ee5e63faa6db5b8a88a3ebea35ef67c33588fd')

build() {
  cd "${pkgbase}-${pkgver}"
  python setup.py build

  mkdir -p $srcdir/pkgdir
  python setup.py install --root="$srcdir/pkgdir" --optimize=1 --skip-build
  mv $srcdir/pkgdir/usr/bin/neowofetch $srcdir/neowofetch
}

package_hyfetch() {
  depends=(python-setuptools python-typing_extensions)

  cd "${pkgbase}-${pkgver}"
  cp -r $srcdir/pkgdir/* $pkgdir/

  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  install -Dm 644 "${pkgname}/scripts/autocomplete.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgbase}"
  install -Dm 644 "${pkgname}/scripts/autocomplete.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgbase}"
}

package_neowofetch() {
  provides=(neofetch)
  conflicts=(neofetch)
  replaces=(neofetch)
  install -Dm 755 $srcdir/neowofetch $pkgdir/usr/bin/neowofetch
  ln -s neowofetch $pkgdir/usr/bin/neofetch
  install -Dm 644 "${pkgbase}-${pkgver}"/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
