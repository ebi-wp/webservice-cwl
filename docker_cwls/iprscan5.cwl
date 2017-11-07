# European Bioinformatics Institute (EMBL-EBI), Web Production
cwlVersion: v1.0
class: CommandLineTool
baseCommand: iprscan5_lwp.pl 
hints:
  DockerRequirement:
    dockerPull: ebiwp/ebitools-container

inputs:

  email:
    type: string
    doc: Submitter's email.
    inputBinding:
      position: 2
      prefix: --email
    default: 'joonlee@ebi.ac.uk'
    
  sequence:
    type: string
    inputBinding:
      position: 3
      prefix: --sequence
    default: uniprot:wap_rat


  
  title:
    type: string        
    inputBinding:
      position: 4
      prefix: --title
#    default: '$defaultValue'

  goterms:
    type: boolean       
    inputBinding:
      position: 5
      prefix: --goterms
#    default: '$defaultValue'

  pathways:
    type: boolean       
    inputBinding:
      position: 6
      prefix: --pathways
#    default: '$defaultValue'

  appl:
    type: string
    inputBinding:
      position: 7
      prefix: --appl
#    default: '$defaultValue'


outputs: 
  cwl_out: 
    type: File[]
    streamable: true
    outputBinding:
      glob: "*.*"