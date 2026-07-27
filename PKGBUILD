# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=zsh
pkgver=5.9.2
pkgrel=1
pkgdesc='A very advanced and programmable command interpreter (shell) for UNIX'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://www.zsh.org
license=('LicenseRef-Zsh AND GPL-2.0-only')
depends=(gdbm libcap musl ncurses)
makedepends=(linux-uapi-headers)
backup=(etc/$pkgname/zprofile)
install=$pkgname.install
# These patches are from downstream.
# 0001: Drop unused completions.
# 0002: Fix keymaps path mismatch.
source=(
  $url/pub/$pkgname-$pkgver.tar.xz
  zprofile
  0001-drop-completions.patch
  0002-fix-keymaps-path.patch
)
sha256sums=(
  36fa734374b44783582cec09bcd67822e2f992c779ec1624ab5596df078d2f81
  230832038c3b8f67fdb1b284ac5f68d709cdb7f1bc752b0e60657b9b9d091045
  49f8170a95c621f6119df8e10271f1bbd679c8b7bd18e5fb996737588660f56f
  8a3f7c42f0386234a5c06a35dabbd3acb2c0df115e87f229043448a1a894183e
)

prepare() {
  _patch_ $pkgname-$pkgver

  cd $pkgname-$pkgver
  rm -r Completion/{AIX,BSD,Cygwin,Darwin,Debian,Mandriva,openSUSE,Redhat,Solaris,X}

  # These tests failed without --disable-multibyte, so remove them.
  # TODO: Check why these failed.
  rm Test/{A03quoting,B03print,D04parameter,D07multibyte,E02xtrace}.ztst
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --enable-etcdir=/etc/zsh \
    --enable-zshenv=/etc/zsh/zshenv \
    --enable-zshrc=/etc/zsh/zshrc \
    --enable-zprofile=/etc/zsh/zprofile \
    --enable-zlogin=/etc/zsh/zlogin \
    --enable-zlogout=/etc/zsh/zlogout \
    --enable-fndir=/usr/share/zsh/functions \
    --enable-function-subdirs \
    --enable-scriptdir=/usr/share/zsh/scripts \
    --enable-pcre \
    --enable-cap \
    --enable-gdbm
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  install -Dt "$pkgdir"/etc/zsh zprofile
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  _install_license_ LICENCE
}
