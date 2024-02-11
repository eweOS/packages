# Maintainer: YukariChiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=bash
pkgver=5.2.21
pkgrel=1
pkgdesc='The GNU Bourne Again shell'
arch=(x86_64 aarch64 riscv64)
license=(GPL3)
url="https://www.gnu.org/software/bash/"
groups=(base)
depends=(readline ncurses)
provides=('sh')
source=(
  "http://ftp.gnu.org/gnu/bash/${pkgname}-${pkgver}.tar.gz"
  bashrc
)

sha256sums=('c8e31bdc59b69aaffc5b36509905ba3e5cbb12747091d27b4b977f078560d5b8'
            'b3c0c7600098df7ab736cc5ea7ecd671a6cc83b7a01ea23dec94ac073fe86b6b')

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
