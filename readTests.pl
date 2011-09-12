#!/usr/bin/perl -w

sub getStatus($);
sub getMsg($);

$n = $ARGV[0];
$task = $ARGV[1];

open(COUT, ">>out");

if ($task eq "status") {
	$out = getStatus($n);
	print $out;
	print COUT "status: $out\n";
} elsif ($task eq "msg") {
	$out = getMsg($n);
	print $out;
	print COUT "msg: $out";
} else {
	print "unknown request $task\n";
	print COUT "unknown request $task\n";
}

close(COUT);

sub getStatus($) {
	$n = $_[0];
	$out = "";
	if (!open("cin", $n)) {
		$out = "Perl Error: cannot find file $n";
	} else {
		$l = <cin>;
		while ($out eq "") {
			if ($l =~ /^.*<td>result:<\/td>.*$/) {	
				$out = "next";
			}
			$l = <cin>;
		}
		$out = $l;
		$out =~ /^.*<td>(.*)<\/td>.*$/;	
		$out = $1;
	}
	close("cin");
	return $out;
}

sub getMsg($) {
	$n = $_[0];
	$out = "hello";
	@search = ("numTestTotal", "numTestPasses", "numTestFailures", "numCommandPasses", "numCommandFailures", "numCommandErrors");
	if (!open("cin", $n)) {
		$out = "Perl Error: cannot find file $n";
		return $out;
	}
	$i = 0;
	$l = <cin>;
	$n = 0;
	while ($i < @search && $l) {
		if ($n != 0) {
			$l =~ /^.*<td>(.*)<\/td>.*$/;
			$out .= "\n$search[$i] = $1";
			$n = 0;
			$i += 1;
		} elsif ($l =~ /^.*<td>$search[$i]:<\/td>.*$/) {
			$n = 1;		
		}
		$l = <cin>;
	}
	close("cin");
	return $out;
}
