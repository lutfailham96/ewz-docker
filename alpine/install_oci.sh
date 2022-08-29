set -ex; \
apk add --no-cache \
    ca-certificates \
    libaio \
    libnsl \
    unzip \
    wget; \
wget -O instantclient.zip "https://download.oracle.com/otn_software/linux/instantclient/217000/instantclient-basiclite-linux.x64-${INSTANT_CLIENT_VERSION}.0.0dbru.zip"; \
sha256_oci="8a745ad7f4290ff8f7bd1d9436f6afdf07644e390b5d6acc3dc50978687795cb"; \
echo "${sha256_oci}  instantclient.zip" | sha256sum -c - || exit 1; \
unzip instantclient.zip; \
rm -rf instantclient.zip; \
mkdir -p ${ORACLE_BASE}; \
mv instantclient_*/* ${ORACLE_BASE}/; \
rm -rf instantclient_*; \
ln -s ${ORACLE_BASE}/libclntsh.so.21.1 /usr/lib/libclntsh.so; \
ln -s ${ORACLE_BASE}/libocci.so.21.1 /usr/lib/libocci.so; \
ln -s ${ORACLE_BASE}/libociicus.so /usr/lib/libociicus.so; \
ln -s ${ORACLE_BASE}/libnnz21.so /usr/lib/libnnz21.so; \
rm -f install_oci.sh

