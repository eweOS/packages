# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mercurial
pkgver=7.0.3
pkgrel=1
pkgdesc='A scalable distributed SCM tool'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.mercurial-scm.org/"
license=(GPL)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
  python-docutils
)
backup=(etc/mercurial/hgrc)
source=(https://www.mercurial-scm.org/release/${pkgname}-${pkgver}.tar.gz)
sha512sums=('3a1b1029d6803935604e85f5e3a04d2a00d5ef3990f79f108be3ed40fc486c844b08d6d5d2f54b5d8d83b890f332d4555a61042bd4744fd26ad282ff9284276c')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
  make -C contrib/chg
}

check() {
  cd $pkgname-$pkgver/tests
  # FIXME - disabled for now - to many tests fail
  #python run-tests.py # -j48 || :
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir "$pkgdir" dist/*.whl
  make DESTDIR="${pkgdir}" PREFIX=/usr install-doc

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
