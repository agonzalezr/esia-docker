FROM centos:8

RUN dnf update -y

#Librerias principales
RUN dnf install -y epel-release dnf-plugins-core python38 wget gcc-gfortran gdb curl m4 gcc-c++ python3-devel

# Libs adicionales
RUN dnf config-manager --set-enabled PowerTools
RUN dnf install -y libdap gdal gdal-libs gdal-devel

# Dependencias de python
RUN python3 -m pip install Cython
RUN python3 -m pip install h5py
RUN python3 -m pip install netCDF4
RUN python3 -m pip install wrapt
RUN python3 -m pip install setuptools
RUN python3 -m pip install --global-option=build_ext --global-option="-I/usr/include/gdal" GDAL==`gdal-config --version`

# Copy the files
COPY . /root

# Set working directory
WORKDIR /root