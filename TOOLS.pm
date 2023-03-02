package TOOLS;

    use warnings;
    use strict;
    our $path_to_f = "$ENV{HOME}/Git_lab_reps/perl-1/conf.ini";
    use Data::Dumper;
#---------------------------------------------------------------------
# out subs

sub login{

    my $v_name = shift;
    my $v_pass = shift;
    my %check_user = &_check_user();

    my $enter_name = &_check_user_name($v_name);
    my $chek_p =_check_user_passd($v_pass);

    my $v_res = -1;
    if ( exists $check_user{"$v_name"} ) {
        if ( $v_pass eq $check_user{$v_name} ) {            
            $v_res = 1;
        } else {
            $v_res = 0;
        }
    }
    return $v_res;
}

sub reg_user{

    my $v_name = shift;
    my $v_pass = shift;
    my %check_user = &_check_user();

    my $enter_name = &_check_user_name($v_name);
    my $chek_p =_check_user_passd($v_pass);
    my $v_res = -1;

    if ( exists $check_user{"$v_name"} ) {
        print "We have this login, please come up with a new login. See you\n";
    } else {
        open ( my $STRING , '>>' , $path_to_f ) or die "Can`t open log file\n";
        print $STRING "$v_name\=$v_pass\n";
        close $STRING;
        print "Now we are know you\n";
        exit;
    }
    
}

sub del_user{

    my $v_name = shift;
    my $v_pass = shift;
    my %check_user = &_check_user();

    my $enter_name = &_check_user_name($v_name);
    my $chek_p =_check_user_passd($v_pass);

    if ( exists $check_user{"$v_name"} ) {
        if ( $v_pass eq $check_user{"$v_name"} ) {
            &_rewrite_config($v_name);
        } else {
            print "Wrong password. User not del.\n";
        }
    } else {
        print "We have no one with this name.Please reg.See you\n";
        exit;
    }
}


sub change_pass{

    my $v_name = shift;
    my $v_pass = shift;
    my %check_user = &_check_user();

    my $enter_name = &_check_user_name($v_name);
    my $chek_p =_check_user_passd($v_pass);

    if ( exists $check_user{"$v_name"} ) {
        if ( $v_pass eq $check_user{"$v_name"} ) {
            print "Enter new pass\n";
            chomp ( my $new_pass = (<STDIN>) );
            my $check_new_pass = &_check_user_passd($new_pass);
            &_rewrite_pass($v_name, $v_pass, $new_pass);
        } else {
            print "Wrong old password.\n";
        }
    } else {
        print "We have no one with this name.Please reg.See you\n";
        exit;
    }
}


#----------------------------------------------------------------------------
# in subs


sub _read_conf{
    open my $CONFIG, "<", $path_to_f or die "Not found file $path_to_f\n";
    my @conf_path = <$CONFIG>;
    close $CONFIG;
    return @conf_path;
}

sub _check_user{
    my %log_pas;
    my @conf_path = &_read_conf();    
    foreach my $f_line (@conf_path) {
        if ( $f_line =~ m/^\#/ ) {
            redo;
        }
        $f_line =~ s/^\s+|\s+$//g;
        my ( $h_key, $h_val ) = split "=", $f_line;
        if ( $h_key =~ m/\w/ && $h_val =~ m/\w/ ) {
            $log_pas{$h_key} = $h_val;       
        }
    }    
    my %check_user = %log_pas;
    return %check_user;
}

sub _check_user_name{    
    my $v_name = shift;
    if ( $v_name =~ m/(?=^.{8,})((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/ ) {
        return "good login\n";
    } else {
        print "User name must 8 or more symb\nBegin by latin character\nBe with one of (@#\$%^&*())\nMust be at least one uppercase character\nMust be at least one number\n ";
        exit;
    }
}

sub _check_user_passd{
    my @take_pass = @_;
    my $v_pass = $take_pass[0];
    if ( $v_pass =~ m/^.{8,}$/ ) {
        if ( $v_pass =~ m/^[a-zA-Z]/ ) {
            if ( $v_pass =~ m/[\@\#\$\%\^\&\*\(\)]/ ) {
                if ( $v_pass =~ m/[A-Z]/ ) {
                    if ( $v_pass =~ m/[0-9]/ ) {
                        return 1;
                    } else {
                        print "In password must be at least one number\n";
                    }
                } else {
                    print "In password must be at least one uppercase character\n";
                }
            } else {
                print 'In password must be with one of (@#$%^&*())'."\n";
            }
        } else { 
            print "Password must begin by letter\n";
        }
    } else {
        print "Password must be 8 or more symb\n";
    }
    exit;
}

sub _rewrite_config{
    my $del_name = @_;
    print "\$del_name $del_name\n";
    
    open ( my $NAM_PAS , '<' , $path_to_f ) or die "Can`t open log file to read\n";
    my @NAM_PAS = <$NAM_PAS>;
    close $NAM_PAS;
    open ( $NAM_PAS, '>' , $path_to_f ) or die "Can`t open log file to execute\n";
        foreach my $LINE ( @NAM_PAS ){
            print $NAM_PAS $LINE unless ( $LINE =~ m/$del_name/ );
        }
    close $NAM_PAS;
    my $chek_deleted = _chek_del($del_name);
}

sub _chek_del{
    my $del_name = @_;
    my %check_user = &_check_user();
    if ( exists $check_user{$del_name} ) {
        print "Not del, sorry try again\n";
    } else {
        print "Del was succefull\n";
    }
    exit;
}

sub _rewrite_pass{
    my $login = shift;
    my $old_pasa = shift;
    my $new_pass = shift;
    open ( my $NAM_PAS , '<' , $path_to_f ) or die "Can`t open log file to read\n";
    my @NAM_PAS = <$NAM_PAS>;
    close $NAM_PAS;
    open ( $NAM_PAS, '>' , $path_to_f ) or die "Can`t open log file to execute\n";
        foreach my $LINE ( @NAM_PAS ){
            if ( $LINE =~ m/$login/ ){
                $LINE = "$login=$new_pass\n";
            }
            print $NAM_PAS $LINE;
        }
    close $NAM_PAS;
    print "New pass applied\n";
    exit;
}

1;