# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=hyfetch
pkgname=(hyfetch neowofetch)
pkgver=1.4.11
pkgrel=1
pkgdesc="Neofetch with LGBTQ+ pride flags!"
arch=('any')
url='https://github.com/hykilpikonna/hyfetch'
license=('MIT')
depends=('python-setuptools' 'python-typing_extensions')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('79cd6706a681fa7c05754b35d9338abf96bebce222c27376a4155e94d6a5350d')

build() {
  cd "${pkgbase}-${pkgver}"
  python setup.py build
  
  mkdir -p $srcdir/pkgdir
  python setup.py install --root="$srcdir/pkgdir" --optimize=1 --skip-build
  mv $srcdir/pkgdir/usr/bin/neowofetch $srcdir/neowofetch
}

package_hyfetch() {
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
