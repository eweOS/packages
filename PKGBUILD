# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=crun
pkgver=1.31
pkgrel=1
pkgdesc="A fast and lightweight fully featured OCI runtime and C library for running containers"
url="https://github.com/containers/crun"
license=('LGPL-2.1-or-later')
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
provides=('oci-runtime')
depends=('libcap' 'libseccomp' 'libuargp' 'json-c')
makedepends=('python' 'go-md2man' 'git')
source=(
  "git+https://github.com/containers/crun.git#tag=$pkgver"
)
sha256sums=('67465095f19ef9a368ec11b6e4f24b99bfefd55e74f602395f90ed069188dd46')

build() {
    export MAKEFLAGS="CC=cc CXX=c++ -j$JOBS"
    cd "$pkgname"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --enable-shared \
        --enable-dynamic \
        --disable-systemd \
        --disable-criu \
        --with-python-bindings
    make
}
 
package() {
    export MAKEFLAGS="CC=cc CXX=c++ -j$JOBS"
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}
