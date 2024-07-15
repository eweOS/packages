# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=asciidoc
pkgver=10.2.0
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
source=("$_url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        "suppress-python-warnings.patch::$_url/commit/cf72db316e3281249c6f69c5591a0092b231b53d.patch")
sha256sums=('237b2ba5c35c0ae7ccd4cd44ebf1d87c20b2695dae01798954416d492ef7fa0e'
            '26c4f502e92b975c9c1c6b86ff85e62fda2e3a7ddf3efddaa0bdbb9c88f2aeb8')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i \
    -e '/^build: /a \\tpython3 -m build -wn' \
    -e '/pip install/{s#pip install --root#installer -d#;s#\.$#dist/*.whl#}' \
    Makefile.in
  # https://gitlab.archlinux.org/archlinux/packaging/packages/asciidoc/-/issues/2
  patch -p1 -i ../suppress-python-warnings.patch
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
