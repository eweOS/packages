# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-tornado
pkgver=6.5.5
pkgrel=1
pkgdesc='open source version of the scalable, non-blocking web server and tools'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.tornadoweb.org/'
license=('Apache-2.0')
depends=('python')
optdepends=('python-pycurl: for tornado.curl_httpclient'
            'python-pycares: an alternative non-blocking DNS resolver'
            'python-twisted: for tornado.platform.twisted')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
#checkdepends=('python-pycares' 'python-pycurl' 'python-twisted')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tornadoweb/tornado/archive/v$pkgver.tar.gz")
sha512sums=('3b8b83dc0b87cb9c10140a9cf9e9bb45a8c724adcfd83c02f9ede202a3e595adff54d1a5722ffe15d34c428424f7fb7dbc9092b1ab4808036847300ed1c269df')

export TORNADO_EXTENSION=1

build() {
  cd tornado-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  # As of 4.5.3, ignoring test failures about resolving "localhost"
  (
    cd tornado-$pkgver
    python -m installer --destdir=tmp_install dist/*.whl
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH="$PWD/tmp_install/usr/lib/python${python_version}/site-packages:$PYTHONPATH"
    cd tmp_install
    python -m tornado.test.runtests
    python -m tornado.test.runtests --ioloop=tornado.platform.select.SelectIOLoop
    python -m tornado.test.runtests --httpclient=tornado.curl_httpclient.CurlAsyncHTTPClient
    python -m tornado.test.runtests --ioloop_time_monotonic
    python -m tornado.test.runtests --ioloop=tornado.platform.twisted.TwistedIOLoop
    python -m tornado.test.runtests --ioloop=tornado.platform.asyncio.AsyncIOLoop
    python -m tornado.test.runtests --resolver=tornado.netutil.ThreadedResolver
  ) || echo "Tests failed"
}

package() {
  cd tornado-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
