#!/usr/bin/env cwl-runner

# Copyright (C) 2019 EMBL - European Bioinformatics Institute
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#      http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cwlVersion: v1.0
class: CommandLineTool
label: "InterProScan 5"
id: "iprscan5"
baseCommand: python

inputs:
  # Web Service Clients: Common Entries
  command:
    type: File
    inputBinding:
      position: 0
    default:
      class: File
      location: ../../webservice-clients/python/iprscan5.py

  email:
    type: string?
    doc: "E-mail address"
    inputBinding:
      prefix: --email
      position: 2

  title:
    type: string?
    doc: "Job title"
    inputBinding:
      prefix: --title
      position: 3

  jobid:
    type: string?
    doc: "Job identifier"
    inputBinding:
      prefix: --jobid
      position: 1

  polljob:
    type: boolean?
    doc: "Get job result"
    inputBinding:
      prefix: --polljob
      position: 2

  outfile:
    type: string?
    doc: "File name for results"
    inputBinding:
      prefix: --outfile
      position: 4

  outformat:
    type: string?
    doc: "Output format for results"
    inputBinding:
      prefix: --outformat
      position: 5

  pollfreq:
    type: int?
    doc: "Poll frequency in seconds (default 3s)"
    inputBinding:
      prefix: --pollFreq
      position: 6

  params:
    type: boolean?
    doc: "List input parameters"
    inputBinding:
      prefix: --params
      position: 1

  paramdetails:
    type: string?
    doc: "Get details for parameter"
    inputBinding:
      prefix: --paramDetail
      position: 1

  resultTypes:
    type: string?
    doc: "Get result types"
    inputBinding:
      prefix: --resultTypes
      position: 1

  asyncjob:
    type: boolean?
    doc: "Asynchronous mode"
    inputBinding:
      prefix: --asyncjob
      position: 2

  status:
    type: boolean?
    doc: "Get job status"
    inputBinding:
      prefix: --status
      position: 2

  version:
    type: boolean?
    doc: "Prints out the version of the Client and exit"
    inputBinding:
      prefix: --version
      position: 1

  baseUrl:
    type: string?
    doc: "Base URL for service"
    inputBinding:
      prefix: --baseUrl
      position: 7


  multifasta:
    type: boolean?
    doc: "Treat input as a set of fasta formatted sequences"
    inputBinding:
      prefix: --multifasta
      position: 8

  useSeqId:
    type: boolean?
    doc: "Use sequence identifiers for output filenames. Only available in multi-fasta and multi-identifier modes"
    inputBinding:
      prefix: --useSeqId
      position: 9

  maxJobs:
    type: int?
    doc: "Maximum number of concurrent jobs. Only available in multifasta or list file modes (default 20 jobs)"
    inputBinding:
      prefix: --maxJobs
      position: 10

  # Web Service Clients: Different Entries
  sequence:
    type: string?
    label: "Input sequence"
    doc: "Sequence filename or ID"
    inputBinding:
      prefix: --sequence
      position: 8

  goterms:
    type: string?
    label: GO terms
    doc: "Switch on look-up of corresponding Gene Ontology annotations"
    inputBinding:
      prefix: --goterms
      position: 9
    default: "true"

  pathways:
    type: string?
    label: Pathways
    doc: "Switch on look-up of corresponding pathway annotations"
    inputBinding:
      prefix: --pathways
      position: 10
    default: "true"

  appl:
    type: string?
    label: Applications
    doc: "A number of different protein sequence applications are launched. These applications search against specific databases and have preconfigured cut off thresholds."
    inputBinding:
      prefix: --appl
      position: 11
    default: "ProDom,PRINTS,PIRSF,PfamA,SMART,TIGRFAM,PrositeProfiles,HAMAP,PrositePatterns,SuperFamily,SignalP,TMHMM,Panther,Gene3d,Phobius,Coils,CDD,SFLD,MobiDBLite"


outputs:
  all:
    type: File[]
    streamable: true
    outputBinding:
      glob: "*"


$schemas:
  - http://schema.org/docs/schema_org_rdfa.html

$namespaces:
  s: http://schema.org/
  edam: http://edamontology.org/

s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0001-8728-9449
    s:email: mailto:www-prod@ebi.ac.uk
    s:name: Fábio Madeira (Web Production)
    s:worksFor:
    - class: s:Organization
      s:name: EMBL - European Bioinformatics Institute
      s:location: Hinxton, Cambridgeshire, CB10 1SD, UK
      s:department:
      - class: s:Organization
        s:name: Web Production

# s:citation: https://dx.doi.org/10.6084/m9.figshare.3115156.v2
# s:codeRepository: https://github.com/common-workflow-language/common-workflow-language
s:dateCreated: "2018-08-03"

# s:license:
s:license:
  - https://www.apache.org/licenses/LICENSE-2.0
  - https://spdx.org/licenses/Apache-2.0

s:copyrightHolder: "EMBL - European Bioinformatics Institute"
