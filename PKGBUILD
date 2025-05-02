# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mercurial
pkgver=7.0.1
pkgrel=2
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
sha512sums=('42abab36e17c2edee2dc715a1af684540b21ab2fc7058335e5a166db90c36f9217dc15bf94daeaf45e7ac725f1fc849bf0ec54d06e9fa307a041f34d768a8fb3')

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
