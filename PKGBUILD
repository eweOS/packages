# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=openssh
pkgver=10.4p1
pkgrel=1
pkgdesc="SSH protocol implementation for remote login, command execution and file transfer"
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.openssh.com/portable.html'
license=(
  BSD-2-Clause
  BSD-3-Clause
  ISC
  LicenseRef-Public-Domain
  MIT
)
makedepends=(
  krb5
  libedit
  libxcrypt
  linux-headers
  openssl
  pam
  zlib
)
optdepends=(
  'libfido2: FIDO/U2F support'
  'sh: for ssh-copy-id and findssl.sh'
)
backup=(
  etc/pam.d/sshd
  etc/ssh/ssh_config
  etc/ssh/sshd_config
)
source=(
  https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/$pkgname-$pkgver.tar.gz
  99-eweos.conf
  "$pkgname.tmpfiles"
  sshd.pam
  ssh-keygen.service
  sshd.service
)
sha256sums=('ef6026dd2aea8d56059638d5d3262902c892ceba9f88395835e0d06d3fb63238'
            'ac4d74367df7a46dfaa0f522eb15d62ecdbf00b156b10a3a5ef870a0ae74c57b'
            'e8b51db858131b9147d8935ba7a100c16f1cc1ac3638db1fe17934dec094796d'
            '6a5d33c6e9a0f0b8f011a106bd8715e21e4058a244be836bc59faaaa552a3568'
            '28b6acaeb544767fa7c2967617b6be4f3aacd89f2f49d2c4f1af420309f11c14'
            '49511c971bbd19c7144dd493648ec3308099dfd86433f9ceaf9fefdcd289946b')

prepare() {
  cd $pkgname-$pkgver
  # remove variable (but useless) first line in config (related to upstream VCS)
  sed '/^#.*\$.*\$$/d' -i ssh{,d}_config

  # prepend configuration option to include drop-in configuration files for sshd_config
  printf "# Include drop-in configurations\nInclude /etc/ssh/sshd_config.d/*.conf\n" | cat - sshd_config > sshd_config.tmp
  mv -v sshd_config.tmp sshd_config
  # prepend configuration option to include drop-in configuration files for ssh_config
  printf "# Include drop-in configurations\nInclude /etc/ssh/ssh_config.d/*.conf\n" | cat - ssh_config > ssh_config.tmp
  mv -v ssh_config.tmp ssh_config
}

build() {
  local configure_options=(
    --prefix=/usr
    --sbindir=/usr/bin
    --libexecdir=/usr/lib/ssh
    --sysconfdir=/etc/ssh
    --disable-strip
    --disable-security-key
    --with-libedit
    --with-security-key-builtin
    --with-ssl-engine
    --with-pam
    --with-privsep-user=nobody
    --with-privsep-path=/usr/share/empty.sshd
    --with-kerberos5=/usr
    --with-pid-dir=/run
    --with-default-path='/usr/local/sbin:/usr/local/bin:/usr/bin'
    --without-zlib-version-check
  )

  cd "$pkgname-$pkgver"

  ./configure "${configure_options[@]}"
  make
}

check() {
  # NOTE: make t-exec does not work in our build environment
  echo "TODO"
  #make file-tests interop-tests unit -C $pkgname-$pkgver
}

package() {
  depends+=(
    krb5 libkrb5.so libgssapi_krb5.so
    libedit libedit.so
    libxcrypt
    openssl
    pam libpam.so
    zlib libz.so
  )

  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -vDm 644 ../99-eweos.conf -t "$pkgdir/etc/ssh/sshd_config.d/"
  install -vdm 755 "$pkgdir/etc/ssh/ssh_config.d"

  _install_license_ LICENCE

  install -Dm644 ../sshd.pam "$pkgdir"/etc/pam.d/sshd

  install -vDm 644 "../$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  install -Dm755 contrib/findssl.sh -t "$pkgdir"/usr/bin/
  install -Dm755 contrib/ssh-copy-id -t "$pkgdir"/usr/bin/
  install -Dm644 contrib/ssh-copy-id.1 -t "$pkgdir"/usr/share/man/man1/
  
  # services
  _dinit_install_services_ "$srcdir/sshd.service" "$srcdir/ssh-keygen.service"
}
