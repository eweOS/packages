# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-tornado
pkgver=6.6.1
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
sha512sums=('3642296ba92022d87380765708a38839ec55c4042ee2b362afe685561a30f8af26cb30ce7d77a4d8bddba8bb3cee8f25c378c69a8ac133fc1a26c1c4605d45a5')

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
