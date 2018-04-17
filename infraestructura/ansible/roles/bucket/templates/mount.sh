#!/bin/bash

s3fs vencom /vencom/vencom -o passwd_file=/home/operator/.passwd-s3fs,allow_other

s3fs vencom-backup /vencom/vencom_backup -o passwd_file=/home/operator/.passwd-s3fs,allow_other

s3fs vencom-glacier /vencom/vencom_glacier -o passwd_file=/home/operator/.passwd-s3fs,allow_other
