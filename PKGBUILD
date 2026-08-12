# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=podman
pkgname=(podman podman-docker)
pkgver=6.0.2
pkgrel=1
pkgdesc='Tool and library for running OCI-based containers in pods'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/containers/podman'
license=(Apache-2.0)
makedepends=(
  btrfs-progs
  catatonit
  git
  go
  go-md2man
  gpgme
  libseccomp
  python
  mandoc
)
# https://github.com/containers/podman/issues/13297
options=(!lto)
source=(
  "git+$url#tag=v$pkgver"
  busybox-grep.patch
  no-systemd.patch
)
sha256sums=('e48f4ca28a334fb66fafa4a31b0f577366ba2fbb3e36072ff9d73dcab8b5fde8'
            '222f4428ec0446d52ec96925f79d1baef4fb318a308232d14f8fb4c82ad49ed7'
            'f2bdb1af3cf665f63176e5101999ce2d37fd34906e57e6634b090e1624493069')

prepare() {
  _patch_ $pkgbase
}

build() {
  make EXTRA_LDFLAGS='-compressdwarf=false' PREFIX=/usr GOMD2MAN="$(which go-md2man)" -C $pkgbase
  make docker-docs GOMD2MAN="$(which go-md2man)" -C $pkgbase
}

package_podman() {
  depends=(
    catatonit
    conmon
    containers-common
    oci-runtime
    gpgme
    libseccomp
  )
  optdepends=(
    'apparmor: for AppArmor support'
    'btrfs-progs: support btrfs backend devices'
    'cni-plugins: for an alternative container-network-stack implementation'
    'fuse-overlayfs: for storage driver in rootless environment'
    'slirp4netns: for alternative rootless network support'
    'podman-compose: for docker-compose compatibility'
    'podman-docker: for Docker-compatible CLI'
  )

  make install install.completions DESTDIR="$pkgdir" PREFIX=/usr LIBEXECDIR=/usr/lib -C $pkgbase
}

package_podman-docker() {
  pkgdesc='Emulate Docker CLI using podman'
  depends=(
    podman
    sh
  )
  conflicts=(docker)
  provides=(docker)
  replaces=(docker)

  make install.docker-full DESTDIR="$pkgdir" PREFIX=/usr -C $pkgbase
}
