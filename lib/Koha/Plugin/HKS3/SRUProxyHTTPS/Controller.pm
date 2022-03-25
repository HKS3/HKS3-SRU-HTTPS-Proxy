package Koha::Plugin::HKS3::SRUProxyHTTPS::Controller;

use Modern::Perl;

use Mojo::Base 'Mojolicious::Controller';
use URI;
use HTTP::Tiny;
use URI::Escape qw(uri_unescape);

sub proxy {
    my $c = shift->openapi->valid_input or return;

    my $params = $c->req->params->to_hash;

    my $uri = URI->new(uri_unescape( delete $params->{endpoint}));
    $params->{startRecord} ||= 1;
    $params->{maximumRecords} = 20;
    $uri->query_form( $params );

    my $res = HTTP::Tiny->new->get($uri->as_string);

    return $c->render( status => 200, data => $res->{content}, format => 'xml'  );
}

q{ listening to: Elektro Guzzi - Triangle };
