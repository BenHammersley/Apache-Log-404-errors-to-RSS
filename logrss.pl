#!/usr/bin/perl -w
use lib '/home/ben/web/lib/perl';
use strict;
use Date::Manip;


my $yesterdays_date = &UnixDate("yesterday","%Y%m%d");

my $logfile_file = "/web/logs/ben/benhammersley.com/$yesterdays_date.log";

open (LOGFILE, "< $logfile_file");

while (<LOGFILE>) { my ($host, $ident_user, $auth_user, $date, $time, $time_zone, $method, $url, $protocol, $status, $bytes, $referer, $agent) = /^(\S+) (\S+) (\S+) \[([^:]+):(\d+:\d+:\d+) ([^\]]+)\] "(\S+) (.+?) (\S+)" (\S+) (\S+) "([^"]+)" "([^"]+)"$/;

my $cleaned_status = $status || "111";

  if ($cleaned_status == "404") {
    $rss -> add_item(title => "$url",
                     link => "$url",
                    description => "$referer");
                     }

}

close (LOGFILE);

print header('application/xml+rss');

print $rss->as_string;


