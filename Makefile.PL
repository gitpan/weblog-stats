# $Id: Makefile.PL,v 1.2 2004/01/17 20:32:25 comdog Exp $
use ExtUtils::MakeMaker;

sub ExtUtils::MM_Any::test_via_harness
	{
    my($self, $perl, $tests) = @_;

    return qq|	$perl "-MTest::Manifest" | .
           qq|"-e" "run_t_manifest(\$(TEST_VERBOSE), '\$(INST_LIB)', | .
           qq|'\$(INST_ARCHLIB)')"\n|;
	}

WriteMakefile(
		'NAME'      => 'weblog-stats',
        'VERSION'   => '0.11',

        'EXE_FILES' =>  [ 'weblog-stats' ],
            
        'PREREQ_PM' => {
        	'WWW::Mechanize' => '0',
                },

        'MAN1PODS'  => {
                'weblog-stats' => '$(INST_MAN1DIR)/weblog-stats.1',
                },

        clean => { FILES => '*.bak weblog-stats-*' },
        );
        
1;
