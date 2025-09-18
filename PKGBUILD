# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=crun
pkgver=1.24
pkgrel=1
pkgdesc="A fast and lightweight fully featured OCI runtime and C library for running containers"
url="https://github.com/containers/crun"
license=('LGPL')
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
provides=('oci-runtime')
depends=('yajl' 'libcap' 'libseccomp' 'libuargp')
makedepends=('python' 'go-md2man' 'git')
source=("git+https://github.com/containers/crun.git#tag=$pkgver")
sha256sums=('9e0cdb3e2b660620ec70c5a31bc934a33cf48fa30ec7c1cd3a241cc9c3a7a854')

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
