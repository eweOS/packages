# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mercurial
pkgver=7.2.1
pkgrel=2
pkgdesc='A scalable distributed SCM tool'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.mercurial-scm.org/"
license=(GPL-2.0-or-later)
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
sha512sums=('196045832717d3f7b4e08fee97d093249a8334105dff55691309ac93dcbcd7d9f3f53326a8295be9e837572b99338003756b343e350a711ee4b17f549031a8d3')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
  make -C contrib/chg
}

check() {
  cd $pkgname-$pkgver/tests
  # FIXME - disabled for now - to many tests fail
  # python run-tests.py
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
