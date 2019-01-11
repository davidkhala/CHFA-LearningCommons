
Install and Instantiate chaincode package
--------
peer chaincode install -n sacc -p github.com/chaincode/sacc -v 0

Configure endorsement policy
--------
peer chaincode instantiate -o orderer.example.com:7050 -C mychannel \
-n sacc -v 0 -c '{"Args":["john","0"]}' -P "AND ('Org1MSP.member','Org2MSP.member')" \
--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

Define collection policy for private data
--------
peer chaincode install -n marblesp -v 0 -p github.com/chaincode/marbles02_private/go/
//then switch to another peer
export CORE_PEER_ADDRESS=peer1.org1.example.com:7051
peer chaincode install -n marblesp -v 0 -p github.com/chaincode/marbles02_private/go/

//then switch to another org
export CORE_PEER_LOCALMSPID=Org2MSP
export PEER0_ORG2_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt
export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG2_CA
export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp
export CORE_PEER_ADDRESS=peer0.org2.example.com:7051
peer chaincode install -n marblesp -v 0 -p github.com/chaincode/marbles02_private/go/


export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
peer chaincode instantiate -o orderer.example.com:7050 --tls --cafile $ORDERER_CA -C mychannel -n marblesp -v 0 -c '{"Args":["init"]}' -P "OR('Org1MSP.member','Org2MSP.member')" --collections-config  $GOPATH/src/github.com/chaincode/marbles02_private/collections_config.json



Modify or upgrade chaincode
--------
peer chaincode upgrade -o orderer.example.com:7050 --tls --cafile $ORDERER_CA -C mychannel -n marblesp -v 1 -c '{"Args":["init"]}' -P "OR('Org1MSP.member','Org2MSP.member')" --collections-config  $GOPATH/src/github.com/chaincode/marbles02_private/collections_config.json