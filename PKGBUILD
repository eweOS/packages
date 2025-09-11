# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kbd
pkgver=2.9.0
pkgrel=1
pkgdesc="Keytable files and keyboard utilities"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="http://www.kbd-project.org"
license=('GPL-2.0-or-later')
depends=(pam)
makedepends=(check git linux-headers)
# TODO: valgrind isn't available on loongarch64
# checkdepends=(valgrind)
# 0001: Downstream, fixes Makefile.coomon compatibility with busybox chmod
# 0002: Maybe should be upstreamed, fixes Euro symbol is mapped incorrectly
#	with de-latin1 keymap.
#	Unconfirmed bug, originally reported in https://bugs.archlinux.org/task/28213
source=(
  git+https://git.kernel.org/pub/scm/linux/kernel/git/legion/kbd.git#tag=v$pkgver
  'config.rpath::https://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=blob_plain;f=build-aux/config.rpath;hb=HEAD'
  0001-Makefile.common-Get-access-rights-with-stat.patch
  0002-fix-euro2-mapping.patch
)
backup=('etc/pam.d/vlock')
sha256sums=('568959073de128c4f2e952856c2fdf397d357989535505bd8440830d2dfcf344'
            '772c44d89098cbcc95b12cee420fd2f1833ac2da0338df99c5e590d1c1672234'
            'ad121d6b04304580719db552b1d729465c70f37a2c6aa20703f172efb2a179a0'
            'a5e0167b6a82a9eb4d581d56baab930c2d80f5541dc34630460b73e1115384b8')

prepare() {
  _patch_ "$pkgname"

  cd "$pkgname"
  cp "$srcdir"/config.rpath config/
  # rename keymap files with the same names
  # this is needed because when only name of keymap is specified
  # loadkeys loads the first keymap it can find, which is bad (see FS#13837)
  # this should be removed when upstream adopts the change
  mv data/keymaps/i386/qwertz/cz{,-qwertz}.map
  mv data/keymaps/i386/olpc/es{,-olpc}.map
  mv data/keymaps/i386/olpc/pt{,-olpc}.map
  mv data/keymaps/i386/fgGIod/trf{,-fgGIod}.map
  mv data/keymaps/i386/colemak/{en-latin9,colemak}.map
  autoreconf -if
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr \
    --sysconfdir=/etc  \
    --datadir=/usr/share/kbd  \
    --mandir=/usr/share/man  \
    --enable-optional-progs
  make KEYCODES_PROGS=yes RESIZECONS_PROGS=yes
}

# Require valgrind to run
# check() {
#  cd "$pkgname"
#
#  make check
# }

package() {
  cd "$pkgname"
  make KEYCODES_PROGS=yes RESIZECONS_PROGS=yes DESTDIR="$pkgdir" install

  # remove commands provided by busybox
  for exe in chvt deallocvt fgconsole kbd_mode openvt setfont setkeycodes setlogcons showkey vlock; do
    rm "$pkgdir"/usr/bin/$exe
  done
}
