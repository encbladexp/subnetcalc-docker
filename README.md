# subnetcalc for Docker

This image is based on Alpine and available on
[Dockerhub](https://hub.docker.com/r/encbladexp/subnetcalc).

## Usage

KISS

    ~ docker container run --rm encbladexp/subnetcalc 10.0.0.0/8
    Address       = 10.0.0.0
                       00001010 . 00000000 . 00000000 . 00000000
    Network       = 10.0.0.0 / 8
    Netmask       = 255.0.0.0
    Broadcast     = 10.255.255.255
    Wildcard Mask = 0.255.255.255
    Hosts Bits    = 24
    Max. Hosts    = 16777214   (2^24 - 2)
    Host Range    = { 10.0.0.1 - 10.255.255.254 }
    Properties    =
       - 10.0.0.0 is a NETWORK address
       - Class A
       - Private
    DNS Hostname  = (Name does not resolve)

## Build

As we have a very simple compose file, just:

    docker compose build
