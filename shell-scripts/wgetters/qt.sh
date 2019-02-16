#! /bin/bash
printf '%s\n' "$(date) $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

wget https://download.qt.io/archive/qt/5.12/5.12.1/single/qt-everywhere-src-5.12.1.tar.xz &
wget https://download.qt.io/archive/qt/5.11/5.11.2/single/qt-everywhere-src-5.11.2.tar.xz &
wget https://download.qt.io/archive/qt/5.11/5.11.3/single/qt-everywhere-src-5.11.3.tar.xz &
wget https://download.qt.io/archive/qt/5.10/5.10.0/single/qt-everywhere-src-5.10.0.tar.xz &
wget https://download.qt.io/archive/qt/5.10/5.10.1/single/qt-everywhere-src-5.10.1.tar.xz &
wget https://download.qt.io/archive/qt/5.9/5.9.1/single/qt-everywhere-opensource-src-5.9.1.tar.xz &
wget https://download.qt.io/archive/qt/5.9/5.9.2/single/qt-everywhere-opensource-src-5.9.2.tar.xz &
wget https://download.qt.io/archive/qt/5.9/5.9.7/single/qt-everywhere-opensource-src-5.9.7.tar.xz &
wget https://download.qt.io/archive/qt/5.8/5.8.0/single/qt-everywhere-opensource-src-5.8.0.tar.xz &
wget https://download.qt.io/archive/qt/5.7/5.7.1/single/qt-everywhere-opensource-src-5.7.1.tar.xz &
wget https://download.qt.io/archive/qt/5.7/5.7.0/single/qt-everywhere-opensource-src-5.7.0.tar.xz &
wget https://download.qt.io/archive/qt/5.5/5.5.1/single/qt-everywhere-opensource-src-5.5.1.tar.xz &

wait

a="5.5.1 5.8.0 5.7.0 5.9.1 5.7.1 5.9.1 5.9.2 5.9.7"
b="5.10.0 5.10.1 5.11.2 5.11.3 5.12.1"

for v in ${a}; do
    mv "qt-everywhere-opensource-src-${v}.tar.xz" "qt-${v}.tar.xz"
done

for v in ${b}; do
    mv "qt-everywhere-src-${v}.tar.xz" "qt-${v}.tar.xz"
done
