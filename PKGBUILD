# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=crun
pkgver=1.27.1
pkgrel=1
pkgdesc="A fast and lightweight fully featured OCI runtime and C library for running containers"
url="https://github.com/containers/crun"
license=('LGPL')
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
provides=('oci-runtime')
depends=('yajl' 'libcap' 'libseccomp' 'libuargp')
makedepends=('python' 'go-md2man' 'git')
source=("git+https://github.com/containers/crun.git#tag=$pkgver")
sha256sums=('0d6a1c945e1bf73371196c5625a15cdfa9dde0c0e6a7dd696964d3fd906ac74c')

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
