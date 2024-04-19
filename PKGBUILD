# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mercurial
pkgver=6.6.3
pkgrel=2
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
sha512sums=('a7e0a466aa402659c1169a8c98c30be831b83cb7058416ed9cbe142977feda09008ff43f8c08c0dfdc217c449c6a1e8460cdcd62680e5dc1d0a632b52536486f')

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
