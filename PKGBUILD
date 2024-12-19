# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=pyqt6
pkgname=python-pyqt6
pkgdesc='A set of Python bindings for the Qt6 toolkit'
pkgver=6.8.0
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://riverbankcomputing.com/software/pyqt/intro'
license=(GPL)
groups=(pyqt6)
depends=(qt6-base python-pyqt6-sip)
optdepends=('qt6-tools: QtHelp, QtDesigner bindings'
            'qt6-svg: QtSvg bindings'
            'qt6-declarative: QtQml bindings, qmlplugin'
            'qt6-quick3d: QtQuick3D bindings'
            'qt6-connectivity: QtBluetooth, QtNfc bindings'
            'qt6-multimedia: QtMultimedia, QtSpatialAudio bindings'
            'qt6-positioning: QtPositioning bindings'
            'qt6-remoteobjects: QtRemoteObjects bindings'
            'qt6-sensors: QtSensors bindings'
            'qt6-serialport: QtSerialPort bindings'
            'qt6-speech: QtTextToSpeech bindings'
            'qt6-webchannel: QtWebChannel bindings'
            'qt6-webengine: QtPdf bindings'
            'qt6-websockets: QtWebSockets bindings'
            'dbus-python: for python-dbus mainloop support')
# TODO: missing: qt6-webengine
makedepends=(sip pyqt-builder python-dbus
             qt6-tools qt6-svg qt6-declarative qt6-quick3d qt6-shadertools qt6-multimedia qt6-remoteobjects
             qt6-positioning qt6-sensors qt6-serialport qt6-speech qt6-webchannel qt6-websockets qt6-connectivity)
provides=(qt6-python-bindings)
source=(https://pypi.python.org/packages/source/P/PyQt6/PyQt6-$pkgver.tar.gz)
sha256sums=('6d8628de4c2a050f0b74462e4c9cb97f839bf6ffabbca91711722ffb281570d9')

build() {
  if check_option lto y; then
    _LTO_OPTIONS="--qmake-setting CONFIG+=ltcg"
  else
    _LTO_OPTIONS=""
  fi

  cd PyQt6-$pkgver
  sip-build \
    --confirm-license \
    --no-make \
    --qmake=/usr/bin/qmake6 \
    --api-dir /usr/share/qt6/qsci/api/python \
    --pep484-pyi \
    --verbose \
    ${_LTO_OPTIONS}
  cd build
  make
}

package_python-pyqt6(){
  cd PyQt6-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install

  # compile Python bytecode
  python -m compileall -d / "$pkgdir"/usr/lib
  python -O -m compileall -d / "$pkgdir"/usr/lib

  # fix permissions
  find "$pkgdir"/usr/lib -type f -exec chmod 644 {} \;
  
  # move /bin
  mkdir -p $pkgdir/usr/bin
  mv $pkgdir/bin/* $pkgdir/usr/bin/
  rm -r $pkgdir/bin
}
