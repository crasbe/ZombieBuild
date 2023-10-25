###################################################################################################
#
#
#
#
#
#
#


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

WORKDIR /usr/bin
RUN ln -s python3 python

###################################################################################################
# Get the latest code from the Github Repository

#RUN git clone https://github.com/damienmaguire/Stm32-vcu


ENTRYPOINT ["/bin/sh"]