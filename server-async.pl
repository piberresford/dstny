#!/usr/bin/perl -w

use threads;
use IO::Socket::INET;
use Thread::Semaphore;

use lib ".";
use Prices;

use constant MSG_SIZE => 9;
use constant SESSION_WAIT_SECS => 2;
use constant MAX_CONCURRENT_SESSIONS => 5;

my $server_port = 5000;
my $semaphore = Thread::Semaphore->new(MAX_CONCURRENT_SESSIONS);


my $socket = new IO::Socket::INET (
    LocalHost => '0.0.0.0',
    LocalPort => $server_port,
    Proto => 'tcp',
    Listen => 5,
    Reuse => 1);
die "cannot create socket $!\n" unless $socket;

while ($new_sock = $socket->accept()) {
   if ($semaphore->down_timed(SESSION_WAIT_SECS)) {
        my $th = async {
            eval {
                session($new_sock);
                0;
            } or do {
                $new_sock->close();
                $semaphore->up();
            }
        };
        $th->detach();
    }    
    else {
        $new_sock->close();
    } 
}

sub session {
    my $sock = shift;

    my $prices = new Prices;

    my $buffer;
    while (read($sock, $buffer, MSG_SIZE) && length($buffer) eq MSG_SIZE) {
        my ($action, $p1, $p2) = unpack("cl>l>", $buffer);

        if ($action eq ord("I")) {
            $prices->insert($p1, $p2);
        } 
        elsif ($action eq ord("Q")) {
            my $result = $prices->query($p1, $p2);
            $sock->send(pack("l>", $result));
        }
        else {
            last;
        }
    }
}
