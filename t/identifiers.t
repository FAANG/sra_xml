#!/usr/bin/env perl
use strict;
use Test::More;
use FindBin qw($Bin);
use File::Temp qw/ tempfile /;
use lib ("$Bin/../lib","$Bin/lib");

use TestHelper;
use Bio::SRAXml qw(write_xml_file);
use Test::XML;

my $analysis_set = Bio::SRAXml::Analysis::AnalysisSet->new();

$analysis_set->add_analysis(
    {
        alias         => 'foo_alias',
        analysis_type => 'sample_phenotype',
        title         => 'A title',
        description   => 'The description',
        study_refs    => { 
          refname => 'my_study_alias',
          accession => 'A1',
          refcenter => 'BOB',
          primary_id => {name => 'A1'},
          submitter_id => {namespace => 'BOB', name  => 'SGVP'}
        },
        files    => [
            {
                filename => 'afile.bam',
                filetype => 'bam',
                checksum => 'abcdefg'
            },
        ],

    }
);

my ( $fh, $filename ) = tempfile();

write_xml_file( analysis_set => $analysis_set, filename => $filename );

my $actual = TestHelper::file_to_str(filename => $filename);
my $expected = TestHelper::file_to_str(fh => \*DATA);

is_xml( $actual, $expected, "Analysis with identifiers" );
done_testing();

__DATA__
<ANALYSIS_SET>
    <ANALYSIS alias="foo_alias">
        <TITLE>A title</TITLE>
        <DESCRIPTION>The description</DESCRIPTION>
        <STUDY_REF refname="my_study_alias" accession="A1" refcenter="BOB">
          <IDENTIFIERS>
             <PRIMARY_ID>A1</PRIMARY_ID>
             <SUBMITTER_ID namespace="BOB">SGVP</SUBMITTER_ID>
          </IDENTIFIERS>
        </STUDY_REF>
        <ANALYSIS_TYPE>
            <SAMPLE_PHENOTYPE />
        </ANALYSIS_TYPE>
        <FILES>
            <FILE filename="afile.bam" filetype="bam" checksum_method="MD5" checksum="abcdefg" />
        </FILES>
    </ANALYSIS>
</ANALYSIS_SET>