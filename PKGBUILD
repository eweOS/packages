# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=crun
pkgver=1.27
pkgrel=2
pkgdesc="A fast and lightweight fully featured OCI runtime and C library for running containers"
url="https://github.com/containers/crun"
license=('LGPL')
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
provides=('oci-runtime')
depends=('yajl' 'libcap' 'libseccomp' 'libuargp')
makedepends=('python' 'go-md2man' 'git')
source=("git+https://github.com/containers/crun.git#tag=$pkgver")
sha256sums=('08515e75cf570eaa6d8fb739feb7c006b5f630853fd84609b2788d45fd88e55f')

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
