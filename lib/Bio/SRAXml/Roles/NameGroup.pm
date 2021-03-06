
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
package Bio::SRAXml::Roles::NameGroup;
use strict;
use Moose::Role;

=head1 Description
  
  Role to mixin common namegroup attribute groups (using NameGroup)
  
=cut

has 'alias'       => ( is => 'rw', isa => 'Str' );
has 'center_name' => ( is => 'rw', isa => 'Str' );
has 'broker_name' => ( is => 'rw', isa => 'Str' );
has 'accession'   => ( is => 'rw', isa => 'Str' );

sub name_group_as_hash {
  my ($self) = @_;
  
  my %h;
  
  if (defined $self->alias()){
    $h{alias} = $self->alias();
  }
  
  if (defined $self->center_name()) {
    $h{center_name} = $self->center_name();
  }
  
  if (defined $self->broker_name()){
    $h{broker_name} = $self->broker_name();
  }
  
  if (defined $self->accession()){
    $h{accession} = $self->accession();
  }
  
  return %h;
}

1;
