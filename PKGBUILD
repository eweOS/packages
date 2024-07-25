# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=ca-certificates
pkgname=(
  ca-certificates-utils
  ca-certificates
)
pkgver=20240618
pkgrel=1
pkgdesc="Common CA certificates"
url="https://src.fedoraproject.org/rpms/ca-certificates"
arch=(any)
license=(GPL-2.0-or-later)
makedepends=(asciidoc p11-kit)
source=(
  40-update-ca-trust.hook
  update-ca-trust
  update-ca-trust.8.txt
)
sha256sums=('af777d69eb6ef247716c39ae2fdb228b127e69c5bb56bf87bc0bf881a5729d44'
            'a3b7f2ca62685e4ec3a64a20d49daaf4574a73720d360366d43db76cfa9c70eb'
            '20e7c67602e44c96d8437615afdaeee2bb1c845e11a5431cdc4f18f3261dfbf4')

build() {
  a2x -v -f manpage update-ca-trust.8.txt
}

package_ca-certificates-utils() {
  pkgdesc+=" (utilities)"
  depends=(
    bash
    'p11-kit>=0.24.0'
    symlinks
  )
  provides=(
    ca-certificates
    ca-certificates-java
  )

  install -Dt "$pkgdir/usr/bin" update-ca-trust
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook

  # Trust source directories
  install -d "$pkgdir"/{etc,usr/share}/$pkgbase/trust-source/{anchors,blocklist}

  # Directories used by update-ca-trust (aka "trust extract-compat")
  install -d $pkgdir/etc/ssl/certs/java
  install -d $pkgdir/etc/$pkgbase/extracted
  
  # Compatibility link for OpenSSL using /etc/ssl as CAdir
  # Used in preference to the individual links in /etc/ssl/certs
  ln -s "../../$pkgbase/extracted/tls-ca-bundle.pem" "$pkgdir/etc/ssl/cert.pem"

  # Compatibility link for legacy bundle (Debian)
  ln -s "../../$pkgbase/extracted/tls-ca-bundle.pem" "$pkgdir/etc/ssl/certs/ca-certificates.crt"

  # Compatibility link for legacy bundle (RHEL/Fedora)
  ln -s "../../$pkgbase/extracted/tls-ca-bundle.pem" "$pkgdir/etc/ssl/certs/ca-bundle.crt"

}

package_ca-certificates() {
  pkgdesc+=" (default providers)"
  depends=(ca-certificates-mozilla)
  # replace old ca-certs from curl
  provides=('ca-certs')
  conflicts=('ca-certs')
  replaces=("ca-certs")
}
