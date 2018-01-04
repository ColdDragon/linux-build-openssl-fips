#!/bin/bash
#
# http://wiki.openssl.org/index.php/Android
#
# check fips mode
FIPS=$1
if [ "$FIPS" == "" ]; then	
	FIPS=no
fi
OUTPUT=$2
if [ "$OUTPUT" == "" ]; then	
	OUTPUT=/usr/local/ssl
fi
OPENSSL_FILE=$3
if [ "$OPENSSL_FILE" == "" ]; then	
	OPENSSL_FILE=openssl-1.0.2n
fi
FIPS_FILE=$4
if [ "$FIPS_FILE" == "" ]; then	
	FIPS_FILE=openssl-fips-ecp-2.0.16
fi

OPENSSL_OPTION="no-ssl2 no-ssl3 no-idea no-mdc2 no-rc5 no-ec2m"

OLD_PWD=$(pwd)

rm -rf $OUTPUT
mkdir -p $OUTPUT

if [ "$FIPS" == "yes" ]; then
	export FIPSDIR=$OUTPUT/fips2.0.16
	cd $FIPS_FILE
	./config $OPENSSL_OPTION
	make
	make install
	cd ..
	FIPS_OPTION="fips"
fi

cd $OPENSSL_FILE
./config $FIPS_OPTION shared $OPENSSL_OPTION --openssldir=$OUTPUT --with-fipsdir=$OUTPUT/fips2.0.16
make depend
make
make install
cd ..