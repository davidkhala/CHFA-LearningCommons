# CHFA_LearningCommons
CHFA preparation notes


# About Certified Hyperledger Fabric Administrator

[![](https://www.hyperledger.org/wp-content/uploads/2018/09/HL_Certification_Badges_150ppi-Fabric-300x272.png "CHFA")](#)

https://www.hyperledger.org/resources/training/hyperledger-fabric-certification

## Candidate handbook(temp)
https://bit.ly/2SB3aun

Each question on this exam must be completed on a designated Fabric node, most of which run Fabric under docker/docker-compose. 

Most of the networks are based off of byfn with configuration files located under /srv/fabric-samples, unless otherwise noted in the question text.

Candidates may use their Chrome or Chromium browser to open one additional tab in order to access assets at https://hyperledger-fabric.readthedocs.io/en/release-1.3/

## Syllabus


Application Lifecycle Management – 20%

    Install and Instantiate chaincode package
    Configure endorsement policy
    Define collection policy for private data
    Modify or upgrade chaincode

Install and Configure Network – 25%

    Define network config options (block creation options, etc)
    Modify the world state database configuration
    Define initial multi-org configuration policy
    Configure Ordering service (Kafka)
    Configure Hyperledger Fabric containers
    Enable TLS for communication
    Generate genesis block
    Configure service discovery node (e.g. peer and orderer addresses)

Diagnostics and Troubleshooting – 15%

    Query and analyse peer logs
    Query and analyse CA logs
    Query and analyse Orderer logs
    Query and analyse chaincode logs


Membership Service Provider – 20%

    Configure and start Hyperledger Fabric CA
    Configure ACL
    Create end user identity
    Revoke an identity
    Configure Hyperledger Fabric for hardware security module

Network Maintenance and Operations – 20%

    Add a peer to existing organization
    Create a channel
    Add an org to a channel
    Update channel configuration
    Update a Hyperledger Fabric instance


# Setup

see in `install.sh`