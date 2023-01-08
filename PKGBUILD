# Maintainer: YukariChiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=bash
pkgver=5.1.16
pkgrel=1
pkgdesc='The GNU Bourne Again shell'
arch=(x86_64 aarch64)
license=(GPL3)
groups=(base)
depends=(readline ncurses)
provides=('sh')
source=(
  "http://ftp.gnu.org/gnu/bash/${pkgname}-${pkgver}.tar.gz"
  bashrc
)

sha256sums=(
  'SKIP'
  'SKIP'
)

build()
{
  cd ${pkgname}-${pkgver}

  _bashconfig=(-DDEFAULT_PATH_VALUE=\'\"/usr/local/sbin:/usr/local/bin:/usr/bin\"\'
    -DSTANDARD_UTILS_PATH=\'\"/usr/bin\"\'
    -DSYS_BASHRC=\'\"/etc/bashrc\"\'
    -DNON_INTERACTIVE_LOGIN_SHELLS)
  export CFLAGS="${CFLAGS} ${_bashconfig[@]}"

  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --without-bash-malloc \
    --with-installed-readline \
    --with-curses
  make
}

check()
{
  cd ${pkgname}-${pkgver}
  make check
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -d "${pkgdir}/etc/"
  install -m 0644 "${srcdir}/bashrc" "${pkgdir}/etc/"
  cd ${pkgdir}/usr/bin
  ln -s bash sh
}
