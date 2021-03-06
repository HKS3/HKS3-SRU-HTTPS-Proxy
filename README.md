# Introduction

This is a workaround for [Koha Bug 30322](https://bugs.koha-community.org/bugzilla3/show_bug.cgi?id=30332).

Koha SRU does not support services running via https. This plugin provides a simple proxy server that allowes you to call a local SRU (via http) which then forwards the request to the https service.

# Installation

Get a kzp file from the [release page](https://github.com/HKS3/HKS3-SRU-HTTPS-Proxy/releases) and install it via the Koha plugin system.

## Build kzp file from source

```
cd lib; zip -r ../hks3_sru_https_proxy-0.900.kpz Koha/; cd ..
```

# Configuration

Got to Z39.50/SRU servers administration and add a new SRU Server.

Use the hostname of your own koha instance for `hostname` (use an address that it *not* served via https!) and set `port` to the port your Koha instance is listening to.

For `database` use the endpoint of this Plugin with the hardcoded, URI-escaped URL of the actual SRU service you want to actually call as a param named `endpoint`. Example: `api/v1/contrib/sru-proxy-https/sru-proxy?endpoint=https%3A%2F%2Fservices.obvsg.at%2Fsru%2FOBV-LIT`

As always, set `Additional SRU Options` to `sru=get, sru_version=1.2` and fiddle with SRU search field mappings.

## URI-Escape endpoint

To properly URI-Escape the `endpoint` parameter, run:

```
perl -MURI::Escape=uri_escape -E 'say uri_escape("https://api.example.com/some/sru/endpoint")'
```

# Thanks

Development of this plugin was sponsored by [Steiermärkische Landesbibliothek](https://www.landesbibliothek.steiermark.at/).

