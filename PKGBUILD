# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=crun
pkgver=1.28
pkgrel=1
pkgdesc="A fast and lightweight fully featured OCI runtime and C library for running containers"
url="https://github.com/containers/crun"
license=('LGPL-2.1-or-later')
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
provides=('oci-runtime')
depends=('yajl' 'libcap' 'libseccomp' 'libuargp' 'json-c')
makedepends=('python' 'go-md2man' 'git')
source=(
  "git+https://github.com/containers/crun.git#tag=$pkgver"
  0001-fix-missing-json-c-symbols-in-build.patch
)
sha256sums=('0d01636b19653202e5de7fe94beacdb7099e333a41d7bb6dec63c127364422f1'
            'e3b3616f32d02dd9711be48aec8c9ef8262893d8959378075ad6fdb638fdd3f8')

prepare() {
  # 0001: downstream, copied from archlinux
  _patch_ $pkgname
}

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
