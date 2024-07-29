# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=asciidoc
pkgver=10.2.1
pkgrel=1
pkgdesc='Text document format for short documents, articles, books and UNIX man pages'
arch=('any')
url='https://asciidoc-py.github.io'
_url='https://github.com/asciidoc-py/asciidoc-py'
license=(GPL-2.0-or-later)
depends=(docbook-xsl
         libxslt
         python)
makedepends=(python-build python-installer python-wheel
             python-setuptools)
optdepends=('graphviz: graphviz-filter'
            'lilypond: music-filter'
            'imagemagick: music-filter'
            'source-highlight: source-highlight-filter'
            'dblatex: pdf generation'
            'fop: alternative pdf generation'
            'w3m: text generation'
            'lynx: alternative text generation')
source=("$_url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('aa7be8ae894f6cc1e67784d76ffa6c6b9e9f96efdc695db43c6bd63820e5072b')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i \
    -e '/^build: /a \\tpython3 -m build -wn' \
    -e '/pip install/{s#pip install --root#installer -d#;s#\.$#dist/*.whl#}' \
    Makefile.in
  # https://github.com/asciidoc-py/asciidoc-py/issues/234
  autoconf
}

build() {
  cd ${pkgname}-${pkgver}
  # https://github.com/asciidoc-py/asciidoc-py/issues/234#issuecomment-1045970138
  ./configure \
      --docdir /usr/share/doc/$pkgname \
      --prefix /usr
  make build
}

check() {
  cd ${pkgname}-${pkgver}
  # checkdepends not ready
  #make test
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" docs
  install -Dm0644 -t "$pkgdir/usr/share/man/man1/" doc/*.1
  # ascidocapi is deprecated, but still included in 10.x on a "provisional" basis
  local _platlib="$(python -c 'import sysconfig; print(sysconfig.get_paths()["platlib"])')"
  install -Dm0644 -t "${pkgdir}/${_platlib}/${pkgname}/" asciidoc/api.py
}
