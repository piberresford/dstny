package Prices;

sub new {
    my $self = {
        Prices => {}
    };  

    return bless $self, shift;
}

sub insert {
    my $self = shift;
    my $stamp = shift;
    my $price = shift;

    $self->{Prices}->{$stamp} = $price;
}

sub query {
    my $self = shift;
    my $mintime = shift || 0;
    my $maxtime = shift || 0;

    my $sum = 0;
    my $count = 0;

    while (my ($key, $val) = each(%{$self->{Prices}})) 
    {
        if (($key>=$mintime) && ($key<=$maxtime) )
        {
            $sum += $val;
            $count += 1;
        }
    }
   
    return ($count==0) ? 0 : int($sum / $count);
}

1;
