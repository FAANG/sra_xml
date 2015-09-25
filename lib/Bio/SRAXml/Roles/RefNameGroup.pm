
=head1 LICENSE
   Copyright 2015 EMBL - European Bioinformatics Institute
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at
     http://www.apache.org/licenses/LICENSE-2.0
   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
=cut
package Bio::SRAXml::Roles::RefNameGroup;
use strict;
use Moose::Role;

has 'refname'   => ( is => 'rw', isa => 'Str' );
has 'ref_center'   => ( is => 'rw', isa => 'Str' );
has 'accession'   => ( is => 'rw', isa => 'Str' );

sub refname_group_as_hash {
  my ($self) = @_;
  
  my %h;
  
  if (defined $self->refname()){
    $h{refname} = $self->refname();
  }
  
  if (defined $self->ref_center()) {
    $h{ref_center} = $self->ref_center();
  }
  
  if (defined $self->accession()){
    $h{accession} = $self->accession();
  }
  
  return %h;
}

1;
