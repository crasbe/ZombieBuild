###################################################################################################
# ZombieBuild Dockerfile
# ======================
# 
# This Dockerfile builds a Docker image with all the necessary tools and libraries for building
# the ZombieVerter, OpenInverter and Tesla Model 3 BMS project from Damien Magiure.
# Generally it can be used for most ARM development.
# The container is based on Alpine Linux to reduce the space requirements and the installation time.
#
# See the following pages for more information about...
#  - ZombieVerter: https://github.com/damienmaguire/Stm32-vcu
#  - OpenInverter: https://github.com/jsphuebner/stm32-sine
#  - Tesla M3 BMS: https://github.com/damienmaguire/Tesla-Model-3-Battery-BMS
#  - Alpine Linux: https://www.alpinelinux.org
#
# Author: crasbe
# Date: 2023

# Use Alpine 
FROM alpine:3.14

###################################################################################################
# Install all the required packages

RUN apk add \
    gcc-arm-none-eabi \
	newlib-arm-none-eabi \
	make \
    cmake \
    git \
    python3

###################################################################################################
# Create Symbolic Links

# One of the scripts used in the build process calls "python", which Alpine does not have
# a symlink for. Therefore we create this symlink.
WORKDIR /usr/bin
RUN ln -s python3 python


###################################################################################################
# Configuration of the Image

# Set the Shell as entry point
ENTRYPOINT ["/bin/sh"]