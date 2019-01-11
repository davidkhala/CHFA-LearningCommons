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
CORE_PEER_DISCOVERY_ENABLED=true



Appendix: discovery CLI
------
// write discovery config file
export peerTLSCA=crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export userKey=crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/8dfc639276e7799ba7674fe9554524e0d2a27851a452943e6801547dee14592a_sk
export userCert=crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem
discover --configFile conf.yaml --peerTLSCA $peerTLSCA --userKey $userKey --userCert $userCert  --MSP Org1MSP saveConfig

//peer membership query
discover --configFile conf.yaml peers --channel mychannel  --server peer0.org1.example.com:7051



