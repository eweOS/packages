# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=namcap
pkgver=3.5.2
pkgrel=1
pkgdesc='A Pacman package analyzer'
arch=(any)
url="https://gitlab.archlinux.org/pacman/$pkgname"
license=(GPL-2.0-or-later)
depends=(licenses
         pkgconf
         pyalpm
         python
         python-license-expression
         python-pyelftools)
checkdepends=(python-pytest python-six)
makedepends=(python-build python-installer python-wheel python-setuptools)
_archive="$pkgname-$pkgver"
source=("$url/-/releases/$pkgver/downloads/$_archive.tar.bz2")
sha256sums=('fbd3b1f0777fe457afd3dbb1f55de8adbaeb50257492626bcffd1a3eef67d618')

prepare() {
  cd "$_archive"
  find . -type f -exec sed -i "s/gcc /cc /g; s/'glibc'/'musl'/g; s/'i686' 'x86_64'/'i686' 'x86_64' 'aarch64' 'riscv64'/g" {} \;
  sed -i 's/glibc/musl/g' Namcap/tests/test_depends.py
  sed -i 's/glibc/musl/g' Namcap/tests/test_pacman.py
  # violate eweos makepkg sbin merge rule
  sed -i 's/sbin/sbin-test/g' Namcap/tests/package/test_hardlinks.py
  # no storage group
  sed -i 's/storage/114514/g' Namcap/tests/package/test_fileownership.py
  # remove unused rules
  sed -i '/systemdlocation,/d' Namcap/rules/__init__.py
  # other arch
  sed -i 's/= "i686"/!= "x86_64"/' Namcap/tests/pkgbuild/test_missingvars.py
}

build() {
  cd "$_archive"
  python -m build -wn
}

check() {
  local _disabled_checks=(
    test_systemdlocation_pkgname
    test_noshstk
    test_execstack
    test_rpath_files
    test_sodepends
    test_unusedsodepends_files
    test_shebangdepends
  )
  
  _arg_disabled_checks=""
  for i in ${_disabled_checks[@]}; do
    _arg_disabled_checks+="not $i and "
  done
  
  _arg_disabled_checks=${_arg_disabled_checks% and }

  cd "$_archive"
  env PARSE_PKGBUILD_PATH="$PWD" PATH="$PWD/scripts:$PATH" pytest -k "$_arg_disabled_checks"
}

package() {
  cd "$_archive"
  python -m installer -d "$pkgdir" dist/*.whl
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
  mv "$pkgdir/"{"$site_packages/usr/share",usr}
  rmdir "$pkgdir/$site_packages/usr"
}
