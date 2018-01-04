linux용 openssl(fips)을 빌드하는 방법

주 내용은 https://wiki.openssl.org/index.php/Compilation_and_Installation 를 참조하였습니다.

테스트 환경 : CentOS release 6.7

Openssl : openssl-1.0.2n, openssl-fips-ecp-2.0.16(특허 문제)

- 절차

1. home/user{XXX}/openssl 폴더를 만들고 이동

2. openssl download(https://www.openssl.org/source/)

3. openssl-fips download(https://www.openssl.org/source/)

4. script download(build-linux.sh)

5. build-linux.sh {yes|no} {output path} {openssl version} {openssl-fips version} 실행

- build-linux.sh 상세 옵션

1. fips mode : fips 지원 라이브러리를 만듬

2. output path : output path

3. openssl version : openssl-1.0.2n

4. openssl-fips version : openssl-fips-ecp-2.0.16
