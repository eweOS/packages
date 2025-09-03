# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=shadow
pkgver=4.18.0
pkgrel=1
pkgdesc="Password and account management tool suite with support for shadow files and PAM"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/shadow-maint/shadow"
license=(
  0BSD
  BSD-3-Clause
)
depends=(
  musl
)
makedepends=(
  acl
  attr
  docbook-xsl
  git
  itstool
  libcap
  libxcrypt
  libxslt
  linux-headers
  pam
)
backup=(
  etc/default/useradd
  etc/login.defs
  etc/pam.d/chpasswd
  etc/pam.d/groupmems
  etc/pam.d/newusers
  etc/pam.d/passwd
)
options=(!emptydirs)
# NOTE: distribution patches are taken from https://gitlab.archlinux.org/archlinux/packaging/upstream/shadow/-/commits/4.18.0.arch1
source=(
  git+$url.git#tag=$pkgver
  0001-Disable-replaced-tools-their-man-pages-and-PAM-integ.patch
  0002-Adapt-login.defs-for-PAM-and-util-linux.patch
  0003-Add-Arch-Linux-defaults-for-login.defs.patch
  shadow.{sysusers,tmpfiles}
  useradd.defaults
  LICENSE
)
sha512sums=('14275673ac2a7eecf13079cb8896eb49293d5bc5504f7900f359e0f21a107848d207aaf5c43d39cf96c0ee9e289929d1e53d2ecfbb39cfcc8175a86d85337eb8'
            '127948d66a3be0874d7118e674afc7a15eb9047ea943f7feca81922376ca9bdf52000ad48dca7cb4c32b8f9bd4558eeff4f0701e4944aedc1b1779c35ef26c47'
            '5e47fef33ccd0cf5ce92a049f8cedc7c8d720740f0407e3f281b294d9538edf17714769c990698320a8c27efc63dce56682d2857b8d7f2108909d66fd314974a'
            '90f46612970f324f60ab5d997ec202b53a829f1c802ea10c16b8ebd075529f5193eee3aca842a03504a9a492d23e763208ad82904c05e274a02be1b5edd2bd12'
            '5afac4a96b599b0b8ed7be751e7160037c3beb191629928c6520bfd3f2adcd1c55c31029c92c2ff8543e6cd9e37e2cd515ba4e1789c6d66f9c93b4e7f209ee7a'
            '97a6a57c07502e02669dc1a91bffc447dba7d98d208b798d80e07de0d2fdf9d23264453978d2d3d1ba6652ca1f2e22cdadc4309c7b311e83fa71b00ad144f877'
            '706ba6e7fa8298475f2605a28daffef421c9fa8d269cbd5cbcf7f7cb795b40a24d52c20e8d0b73e29e6cd35cd7226b3e9738dc513703e87dde04c1d24087a69c'
            'a33658d9271e5c537ccd41bf540b463ad2a5eca4a060c80486ff42a736f0aa042d10436e7177c34d792177cb11285243dee1f31c4df54fb0bfaabbc306406930')

prepare() {
  _patch_ $pkgname
  cd $pkgname
  autoreconf -fiv
}

build() {
  local configure_options=(
    --bindir=/usr/bin
    --disable-account-tools-setuid  # no setuid for chgpasswd, chpasswd, groupadd, groupdel, groupmod, newusers, useradd, userdel, usermod
    --enable-man
    --libdir=/usr/lib
    --mandir=/usr/share/man
    --prefix=/usr
    --sbindir=/usr/bin
    --sysconfdir=/etc
    --without-audit
    --with-fcaps  # use capabilities instead of setuid for setuidmap and setgidmap
    --with-group-name-max-length=32
    --with-libpam  # PAM integration for chpasswd, groupmems, newusers, passwd
    --with-yescrypt
    --without-bcrypt
    --without-libbsd  # shadow can use internal implementation for getting passphrase
    --without-nscd  # we do not ship nscd anymore
    --without-selinux
    --without-su  # su is provided by util-linux
  )

  cd $pkgname
  # add extra check, preventing accidental deletion of other user's home dirs when using `userdel -r <user with home in />`
  export CFLAGS="$CFLAGS -DEXTRA_CHECK_HOME_DIR"
  ./configure "${configure_options[@]}"
  make
}

package() {
  depends+=(
    acl attr libxcrypt pam
  )

  cd $pkgname

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C man install

  # license
  install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/0BSD.txt"

  # custom useradd(8) defaults (not provided by upstream)
  install -vDm 600 ../useradd.defaults "$pkgdir/etc/default/useradd"

  install -vDm 644 ../$pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm 644 ../$pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  # adapt executables to match the modes used by tmpfiles.d, so that pacman does not complain:
  chmod 750 "$pkgdir/usr/bin/groupmems"
}
