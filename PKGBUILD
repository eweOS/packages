# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=crun
pkgver=1.25
pkgrel=1
pkgdesc="A fast and lightweight fully featured OCI runtime and C library for running containers"
url="https://github.com/containers/crun"
license=('LGPL')
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
provides=('oci-runtime')
depends=('yajl' 'libcap' 'libseccomp' 'libuargp')
makedepends=('python' 'go-md2man' 'git')
source=("git+https://github.com/containers/crun.git#tag=$pkgver")
sha256sums=('bfa43678d3de3f38d00b0011d819e45b8f6ad25fdaf175eae39380cb35703ded')

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
