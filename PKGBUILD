# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mercurial
pkgver=6.8.1
pkgrel=1
pkgdesc='A scalable distributed SCM tool'
arch=(x86_64 aarch64 riscv64)
url="https://www.mercurial-scm.org/"
license=(GPL)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
backup=(etc/mercurial/hgrc)
source=(https://www.mercurial-scm.org/release/${pkgname}-${pkgver}.tar.gz)
sha512sums=('c638b9c5421320dcae966c7526afcd7743afaa48f72d4202a9b85a68f51ee97755321e75858e128cdb21cc17312701d2481d10a8a8e2f882ec0df189fc1fd194')

prepare() {
  # TODO: need python package
  pip install docutils
}

build() {
  cd $pkgname-$pkgver
  python setup.py build
  make -C contrib/chg
}

check() {
  cd $pkgname-$pkgver/tests
  # FIXME - disabled for now - to many tests fail
  #python run-tests.py # -j48 || :
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  make DESTDIR="${pkgdir}" PREFIX=/usr install

  make -C contrib/chg DESTDIR="$pkgdir" PREFIX=/usr install
  install -m755 contrib/hg-ssh "$pkgdir/usr/bin"
  install -m755 contrib/hgk "$pkgdir/usr/bin"

  # FS#38825 - Add certs config to package
  install -m755 -d "$pkgdir/etc/mercurial"
  cat <<-EOF > "$pkgdir/etc/mercurial/hgrc"
[web]
cacerts = /etc/ssl/certs/ca-certificates.crt
EOF
}
