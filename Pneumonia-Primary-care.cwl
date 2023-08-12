cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  pneumonia-primary-care-influenzal---primary:
    run: pneumonia-primary-care-influenzal---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  pneumonia-primary-care---primary:
    run: pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-influenzal---primary/output
  pneumonia-primary-care-coronavirus---primary:
    run: pneumonia-primary-care-coronavirus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care---primary/output
  pneumonia-primary-care-specified---primary:
    run: pneumonia-primary-care-specified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-coronavirus---primary/output
  pneumonia-primary-care-klebsiella---primary:
    run: pneumonia-primary-care-klebsiella---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-specified---primary/output
  pneumonia-primary-care-tularaemia---primary:
    run: pneumonia-primary-care-tularaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-klebsiella---primary/output
  pneumonia-primary-care-aspergillosis---primary:
    run: pneumonia-primary-care-aspergillosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-tularaemia---primary/output
  cooccurrent-pneumonia-primary-care---primary:
    run: cooccurrent-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-aspergillosis---primary/output
  bacterial-pneumonia-primary-care---primary:
    run: bacterial-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: cooccurrent-pneumonia-primary-care---primary/output
  pneumonia-primary-care-chest---primary:
    run: pneumonia-primary-care-chest---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: bacterial-pneumonia-primary-care---primary/output
  pneumonia-primary-care-parainfluenzal---primary:
    run: pneumonia-primary-care-parainfluenzal---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-chest---primary/output
  pneumonia-primary-care-pertussis---primary:
    run: pneumonia-primary-care-pertussis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-parainfluenzal---primary/output
  pneumonia-primary-care-cough---primary:
    run: pneumonia-primary-care-cough---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-pertussis---primary/output
  adenoviral-pneumonia-primary-care---primary:
    run: adenoviral-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-cough---primary/output
  gangrenous-pneumonia-primary-care---primary:
    run: gangrenous-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: adenoviral-pneumonia-primary-care---primary/output
  pneumonia-primary-care-2019ncov---primary:
    run: pneumonia-primary-care-2019ncov---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: gangrenous-pneumonia-primary-care---primary/output
  pneumonia-primary-care-wuhan---primary:
    run: pneumonia-primary-care-wuhan---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-2019ncov---primary/output
  pneumonia-primary-care-sarscov2---primary:
    run: pneumonia-primary-care-sarscov2---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-wuhan---primary/output
  pneumonia-primary-care-acquired---primary:
    run: pneumonia-primary-care-acquired---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule20
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-sarscov2---primary/output
  pneumonia-primary-care-death---primary:
    run: pneumonia-primary-care-death---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule21
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-acquired---primary/output
  streptococcal-pneumonia-primary-care---primary:
    run: streptococcal-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule22
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-death---primary/output
  pneumonia-primary-care-lobar---primary:
    run: pneumonia-primary-care-lobar---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule23
      potentialCases:
        id: potentialCases
        source: streptococcal-pneumonia-primary-care---primary/output
  upper-pneumonia-primary-care---primary:
    run: upper-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule24
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-lobar---primary/output
  lingular-pneumonia-primary-care---primary:
    run: lingular-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule25
      potentialCases:
        id: potentialCases
        source: upper-pneumonia-primary-care---primary/output
  pneumonia-primary-care-basal---primary:
    run: pneumonia-primary-care-basal---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule26
      potentialCases:
        id: potentialCases
        source: lingular-pneumonia-primary-care---primary/output
  bilateral-pneumonia-primary-care---primary:
    run: bilateral-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule27
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-basal---primary/output
  lower-pneumonia-primary-care---primary:
    run: lower-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule28
      potentialCases:
        id: potentialCases
        source: bilateral-pneumonia-primary-care---primary/output
  pneumonia-primary-care-middle---primary:
    run: pneumonia-primary-care-middle---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule29
      potentialCases:
        id: potentialCases
        source: lower-pneumonia-primary-care---primary/output
  pneumonia-primary-care-bronchopneumonia---primary:
    run: pneumonia-primary-care-bronchopneumonia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule30
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-middle---primary/output
  pneumonia-primary-care-mycoplasma---primary:
    run: pneumonia-primary-care-mycoplasma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule31
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-bronchopneumonia---primary/output
  candidal-pneumonia-primary-care---primary:
    run: candidal-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule32
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-mycoplasma---primary/output
  pneumonia-primary-care-legionella---primary:
    run: pneumonia-primary-care-legionella---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule33
      potentialCases:
        id: potentialCases
        source: candidal-pneumonia-primary-care---primary/output
  pneumonia-primary-care-adenovirus---primary:
    run: pneumonia-primary-care-adenovirus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule34
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-legionella---primary/output
  negative-pneumonia-primary-care---primary:
    run: negative-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule35
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-adenovirus---primary/output
  pneumonia-primary-care-organism---primary:
    run: pneumonia-primary-care-organism---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule36
      potentialCases:
        id: potentialCases
        source: negative-pneumonia-primary-care---primary/output
  pneumonia-primary-care-proteu---primary:
    run: pneumonia-primary-care-proteu---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule37
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-organism---primary/output
  pneumonia-primary-care-staphylococcu---primary:
    run: pneumonia-primary-care-staphylococcu---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule38
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-proteu---primary/output
  pneumonia-primary-care-mycosis---primary:
    run: pneumonia-primary-care-mycosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule39
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-staphylococcu---primary/output
  pneumonia-primary-care-candidiasis---primary:
    run: pneumonia-primary-care-candidiasis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule40
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-mycosis---primary/output
  pneumonia-primary-care-inclusion---primary:
    run: pneumonia-primary-care-inclusion---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule41
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-candidiasis---primary/output
  pneumonia-primary-care-measles---primary:
    run: pneumonia-primary-care-measles---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule42
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-inclusion---primary/output
  pneumonia-primary-care-ornithosis---primary:
    run: pneumonia-primary-care-ornithosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule43
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-measles---primary/output
  pneumonia-primary-care-carinii---primary:
    run: pneumonia-primary-care-carinii---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule44
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-ornithosis---primary/output
  pneumonia-primary-care-qfever---primary:
    run: pneumonia-primary-care-qfever---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule45
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-carinii---primary/output
  pneumonia-primary-care-salmonellosis---primary:
    run: pneumonia-primary-care-salmonellosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule46
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-qfever---primary/output
  pneumonia-primary-care-varicella---primary:
    run: pneumonia-primary-care-varicella---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule47
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-salmonellosis---primary/output
  cytomegaloviral-pneumonia-primary-care---primary:
    run: cytomegaloviral-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule48
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-varicella---primary/output
  pneumonia-primary-care-pneumococcu---primary:
    run: pneumonia-primary-care-pneumococcu---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule49
      potentialCases:
        id: potentialCases
        source: cytomegaloviral-pneumonia-primary-care---primary/output
  pneumonia-primary-care-metapneumovirus---primary:
    run: pneumonia-primary-care-metapneumovirus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule50
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-pneumococcu---primary/output
  pneumonia-primary-care-postmeasle---primary:
    run: pneumonia-primary-care-postmeasle---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule51
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-metapneumovirus---primary/output
  pneumonia-primary-care-anthrax---primary:
    run: pneumonia-primary-care-anthrax---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule52
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-postmeasle---primary/output
  pneumonia-primary-care-mycoses---primary:
    run: pneumonia-primary-care-mycoses---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule53
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-anthrax---primary/output
  pneumonia-primary-care-toxoplasmosis---primary:
    run: pneumonia-primary-care-toxoplasmosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule54
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-mycoses---primary/output
  infectious-pneumonia-primary-care---primary:
    run: infectious-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule55
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-toxoplasmosis---primary/output
  pneumonia-primary-care-nocardiasis---primary:
    run: pneumonia-primary-care-nocardiasis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule56
      potentialCases:
        id: potentialCases
        source: infectious-pneumonia-primary-care---primary/output
  pneumonia-primary-care-classified---primary:
    run: pneumonia-primary-care-classified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule57
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-nocardiasis---primary/output
  parasitic-pneumonia-primary-care---primary:
    run: parasitic-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule58
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-classified---primary/output
  pneumonia-primary-care-pseudomona---primary:
    run: pneumonia-primary-care-pseudomona---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule59
      potentialCases:
        id: potentialCases
        source: parasitic-pneumonia-primary-care---primary/output
  typhoid-pneumonia-primary-care---primary:
    run: typhoid-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule60
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-pseudomona---primary/output
  pneumonia-primary-care-toxoplasma---primary:
    run: pneumonia-primary-care-toxoplasma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule61
      potentialCases:
        id: potentialCases
        source: typhoid-pneumonia-primary-care---primary/output
  atypical-pneumonia-primary-care---primary:
    run: atypical-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule62
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-toxoplasma---primary/output
  pneumonia-primary-care-pplocause---primary:
    run: pneumonia-primary-care-pplocause---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule63
      potentialCases:
        id: potentialCases
        source: atypical-pneumonia-primary-care---primary/output
  pneumonia-primary-care-agent---primary:
    run: pneumonia-primary-care-agent---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule64
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-pplocause---primary/output
  pneumonia-primary-care-ecoli---primary:
    run: pneumonia-primary-care-ecoli---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule65
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-agent---primary/output
  chlamydial-pneumonia-primary-care---primary:
    run: chlamydial-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule66
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-ecoli---primary/output
  pneumonia-primary-care-simplex---primary:
    run: pneumonia-primary-care-simplex---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule67
      potentialCases:
        id: potentialCases
        source: chlamydial-pneumonia-primary-care---primary/output
  pneumonia-primary-care-chaptr---primary:
    run: pneumonia-primary-care-chaptr---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule68
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-simplex---primary/output
  pneumonia-primary-care-aspergillus---primary:
    run: pneumonia-primary-care-aspergillus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule69
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-chaptr---primary/output
  actinomycotic-pneumonia-primary-care---primary:
    run: actinomycotic-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule70
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-aspergillus---primary/output
  nocardial-pneumonia-primary-care---primary:
    run: nocardial-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule71
      potentialCases:
        id: potentialCases
        source: actinomycotic-pneumonia-primary-care---primary/output
  pneumonia-primary-care-chicken---primary:
    run: pneumonia-primary-care-chicken---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule72
      potentialCases:
        id: potentialCases
        source: nocardial-pneumonia-primary-care---primary/output
  pneumonia-primary-care-chlamydiaceae---primary:
    run: pneumonia-primary-care-chlamydiaceae---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule73
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-chicken---primary/output
  pneumonia-primary-care-fungal---primary:
    run: pneumonia-primary-care-fungal---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule74
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-chlamydiaceae---primary/output
  bronchial-pneumonia-primary-care---primary:
    run: bronchial-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule75
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-fungal---primary/output
  lobular-pneumonia-primary-care---primary:
    run: lobular-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule76
      potentialCases:
        id: potentialCases
        source: bronchial-pneumonia-primary-care---primary/output
  pneumonia-primary-care-histoplasma---primary:
    run: pneumonia-primary-care-histoplasma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule77
      potentialCases:
        id: potentialCases
        source: lobular-pneumonia-primary-care---primary/output
  pneumonia-primary-care-chapter---primary:
    run: pneumonia-primary-care-chapter---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule78
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-histoplasma---primary/output
  pneumonia-primary-care-parainfluenza---primary:
    run: pneumonia-primary-care-parainfluenza---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule79
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-chapter---primary/output
  viral-pneumonia-primary-care---primary:
    run: viral-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule80
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-parainfluenza---primary/output
  pneumococcal-pneumonia-primary-care---primary:
    run: pneumococcal-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule81
      potentialCases:
        id: potentialCases
        source: viral-pneumonia-primary-care---primary/output
  pneumonia-primary-care-bacteria---primary:
    run: pneumonia-primary-care-bacteria---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule82
      potentialCases:
        id: potentialCases
        source: pneumococcal-pneumonia-primary-care---primary/output
  pneumonia-primary-care-influenzae---primary:
    run: pneumonia-primary-care-influenzae---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule83
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-bacteria---primary/output
  pneumonia-primary-care-streptococcu---primary:
    run: pneumonia-primary-care-streptococcu---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule84
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-influenzae---primary/output
  pneumonia-primary-care-group---primary:
    run: pneumonia-primary-care-group---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule85
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-streptococcu---primary/output
  gramnegative-pneumonia-primary-care---primary:
    run: gramnegative-pneumonia-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule86
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-group---primary/output
  pneumonia-primary-care-actinomycosis---primary:
    run: pneumonia-primary-care-actinomycosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule87
      potentialCases:
        id: potentialCases
        source: gramnegative-pneumonia-primary-care---primary/output
  pneumonia-primary-care-fever---primary:
    run: pneumonia-primary-care-fever---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule88
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-actinomycosis---primary/output
  pneumonia-primary-care-identified---primary:
    run: pneumonia-primary-care-identified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule89
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-fever---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule90
      potentialCases:
        id: potentialCases
        source: pneumonia-primary-care-identified---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
  inputModule20:
    id: inputModule20
    doc: Python implementation unit
    type: File
  inputModule21:
    id: inputModule21
    doc: Python implementation unit
    type: File
  inputModule22:
    id: inputModule22
    doc: Python implementation unit
    type: File
  inputModule23:
    id: inputModule23
    doc: Python implementation unit
    type: File
  inputModule24:
    id: inputModule24
    doc: Python implementation unit
    type: File
  inputModule25:
    id: inputModule25
    doc: Python implementation unit
    type: File
  inputModule26:
    id: inputModule26
    doc: Python implementation unit
    type: File
  inputModule27:
    id: inputModule27
    doc: Python implementation unit
    type: File
  inputModule28:
    id: inputModule28
    doc: Python implementation unit
    type: File
  inputModule29:
    id: inputModule29
    doc: Python implementation unit
    type: File
  inputModule30:
    id: inputModule30
    doc: Python implementation unit
    type: File
  inputModule31:
    id: inputModule31
    doc: Python implementation unit
    type: File
  inputModule32:
    id: inputModule32
    doc: Python implementation unit
    type: File
  inputModule33:
    id: inputModule33
    doc: Python implementation unit
    type: File
  inputModule34:
    id: inputModule34
    doc: Python implementation unit
    type: File
  inputModule35:
    id: inputModule35
    doc: Python implementation unit
    type: File
  inputModule36:
    id: inputModule36
    doc: Python implementation unit
    type: File
  inputModule37:
    id: inputModule37
    doc: Python implementation unit
    type: File
  inputModule38:
    id: inputModule38
    doc: Python implementation unit
    type: File
  inputModule39:
    id: inputModule39
    doc: Python implementation unit
    type: File
  inputModule40:
    id: inputModule40
    doc: Python implementation unit
    type: File
  inputModule41:
    id: inputModule41
    doc: Python implementation unit
    type: File
  inputModule42:
    id: inputModule42
    doc: Python implementation unit
    type: File
  inputModule43:
    id: inputModule43
    doc: Python implementation unit
    type: File
  inputModule44:
    id: inputModule44
    doc: Python implementation unit
    type: File
  inputModule45:
    id: inputModule45
    doc: Python implementation unit
    type: File
  inputModule46:
    id: inputModule46
    doc: Python implementation unit
    type: File
  inputModule47:
    id: inputModule47
    doc: Python implementation unit
    type: File
  inputModule48:
    id: inputModule48
    doc: Python implementation unit
    type: File
  inputModule49:
    id: inputModule49
    doc: Python implementation unit
    type: File
  inputModule50:
    id: inputModule50
    doc: Python implementation unit
    type: File
  inputModule51:
    id: inputModule51
    doc: Python implementation unit
    type: File
  inputModule52:
    id: inputModule52
    doc: Python implementation unit
    type: File
  inputModule53:
    id: inputModule53
    doc: Python implementation unit
    type: File
  inputModule54:
    id: inputModule54
    doc: Python implementation unit
    type: File
  inputModule55:
    id: inputModule55
    doc: Python implementation unit
    type: File
  inputModule56:
    id: inputModule56
    doc: Python implementation unit
    type: File
  inputModule57:
    id: inputModule57
    doc: Python implementation unit
    type: File
  inputModule58:
    id: inputModule58
    doc: Python implementation unit
    type: File
  inputModule59:
    id: inputModule59
    doc: Python implementation unit
    type: File
  inputModule60:
    id: inputModule60
    doc: Python implementation unit
    type: File
  inputModule61:
    id: inputModule61
    doc: Python implementation unit
    type: File
  inputModule62:
    id: inputModule62
    doc: Python implementation unit
    type: File
  inputModule63:
    id: inputModule63
    doc: Python implementation unit
    type: File
  inputModule64:
    id: inputModule64
    doc: Python implementation unit
    type: File
  inputModule65:
    id: inputModule65
    doc: Python implementation unit
    type: File
  inputModule66:
    id: inputModule66
    doc: Python implementation unit
    type: File
  inputModule67:
    id: inputModule67
    doc: Python implementation unit
    type: File
  inputModule68:
    id: inputModule68
    doc: Python implementation unit
    type: File
  inputModule69:
    id: inputModule69
    doc: Python implementation unit
    type: File
  inputModule70:
    id: inputModule70
    doc: Python implementation unit
    type: File
  inputModule71:
    id: inputModule71
    doc: Python implementation unit
    type: File
  inputModule72:
    id: inputModule72
    doc: Python implementation unit
    type: File
  inputModule73:
    id: inputModule73
    doc: Python implementation unit
    type: File
  inputModule74:
    id: inputModule74
    doc: Python implementation unit
    type: File
  inputModule75:
    id: inputModule75
    doc: Python implementation unit
    type: File
  inputModule76:
    id: inputModule76
    doc: Python implementation unit
    type: File
  inputModule77:
    id: inputModule77
    doc: Python implementation unit
    type: File
  inputModule78:
    id: inputModule78
    doc: Python implementation unit
    type: File
  inputModule79:
    id: inputModule79
    doc: Python implementation unit
    type: File
  inputModule80:
    id: inputModule80
    doc: Python implementation unit
    type: File
  inputModule81:
    id: inputModule81
    doc: Python implementation unit
    type: File
  inputModule82:
    id: inputModule82
    doc: Python implementation unit
    type: File
  inputModule83:
    id: inputModule83
    doc: Python implementation unit
    type: File
  inputModule84:
    id: inputModule84
    doc: Python implementation unit
    type: File
  inputModule85:
    id: inputModule85
    doc: Python implementation unit
    type: File
  inputModule86:
    id: inputModule86
    doc: Python implementation unit
    type: File
  inputModule87:
    id: inputModule87
    doc: Python implementation unit
    type: File
  inputModule88:
    id: inputModule88
    doc: Python implementation unit
    type: File
  inputModule89:
    id: inputModule89
    doc: Python implementation unit
    type: File
  inputModule90:
    id: inputModule90
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
