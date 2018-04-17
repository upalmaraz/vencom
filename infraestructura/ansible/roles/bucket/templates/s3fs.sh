#!/bin/bash

echo MY_ACCESS_KEY:MY_SECURITY_ACCESS_KEY >  /home/operator/.passwd-s3fs

chmod 600  /home/operator/.passwd-s3fs

cd /home/operator/s3fs-fuse

sudo ./autogen.sh

sudo ./configure

sudo make

sudo make install
