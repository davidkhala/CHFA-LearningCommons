 Define network config options (block creation options, etc)
----------------------
fabric-samples/first-network/configtx.yaml 
line:202
 - Orderer
   - BatchTimeout
   - BatchSize

Define initial multi-org configuration policy 
------------------------
fabric-samples/first-network/configtx.yaml 
line:57
 
Configure Ordering service (Kafka)
------------------------
fabric-samples/first-network/configtx.yaml 
line: 229


Configure Hyperledger Fabric containers
------------------------
fabric-samples/first-network/docker-compose-cli.yaml

Modify the world state database configuration
------------------------
fabric-samples/first-network/docker-compose-couch.yaml  
(line 12, 27)

`- CORE_LEDGER_STATE_STATEDATABASE=CouchDB|goleveldb`

Enable TLS for communication
--------------------------
for orderer:fabric-samples/first-network/base/docker-compose-base.yaml
(line 21)
   - ORDERER_GENERAL_TLS_ENABLED=true
   - ORDERER_GENERAL_TLS_PRIVATEKEY=/var/hyperledger/orderer/tls/server.key
   - ORDERER_GENERAL_TLS_CERTIFICATE=/var/hyperledger/orderer/tls/server.crt
   - ORDERER_GENERAL_TLS_ROOTCAS=[/var/hyperledger/orderer/tls/ca.crt]

for peer:fabric-samples/first-network/base/peer-base.yaml
(line 23)

Generate genesis block
--------------------------
fabric-samples/first-network/byfn.sh generate

Configure service discovery node (e.g. peer and orderer addresses)
--------------------------