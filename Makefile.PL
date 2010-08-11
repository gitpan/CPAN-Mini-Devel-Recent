
use strict;
use warnings;

BEGIN { require 5.006; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Create CPAN::Mini mirror with recent developer releases',
  'AUTHOR' => 'David Golden <dagolden@cpan.org>',
  'BUILD_REQUIRES' => {
    'File::Find' => '0',
    'Test::More' => '0.62'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'CPAN-Mini-Devel-Recent',
  'EXE_FILES' => [],
  'LICENSE' => 'apache',
  'NAME' => 'CPAN::Mini::Devel::Recent',
  'PREREQ_PM' => {
    'CPAN' => '1.92',
    'CPAN::HandleConfig' => '0',
    'CPAN::Mini' => '0.567',
    'CPAN::Tarzip' => '0',
    'Config' => '0',
    'File::Basename' => '0',
    'File::Path' => '0',
    'File::Spec' => '3.27',
    'File::Temp' => '0.20',
    'YAML::Syck' => '1.07'
  },
  'VERSION' => '0.05',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



