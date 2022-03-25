# Introduction

This is a workaround for [Koha Bug 30322](https://bugs.koha-community.org/bugzilla3/show_bug.cgi?id=30332).

Koha SRU does not support services running via https. This plugin provides a simple proxy server that allowes you to call a local SRU (via http) which then forwards the request to the https service.

# Installation

Get a kzp file (TODO: provide it...) and install it via the Koha plugin system

# Configuration

Got to Z39.50/SRU servers administration and add a new SRU Server.

Use the hostname of your own koha instance for `hostname` (use an address that it *not* served via https!) and set `port` to the port your Koha instance is listening to.

For `database` use the endpoint of this Plugin with the hardcoded, URI-escaped URL of the actual SRU service you want to actually call as a param named `endpoint`. Example: `api/v1/contrib/sru-proxy-https/sru-proxy?endpoint=https%3A%2F%2Fservices.obvsg.at%2Fsru%2FOBV-LIT`

As always, set `Additional SRU Options` to `sru=get, sru_version=1.2`


