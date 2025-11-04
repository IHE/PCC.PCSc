Invariant:   iti-pdqm-patname
Description: "Either Patient.name.given and/or Patient.name.family and/or Patient.name.text SHALL be present or a Data Absent Reason Extension SHALL be present."
Expression:  "(family.exists() or given.exists() or text.exists()) xor extension.where(url='http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()"
Severity:    #error

Invariant:   iti-pdqm-linkstatus
Description: "If Patient.link is present, then Patient.active SHALL be present"
Expression:  "link.exists() implies active.exists()"
Severity:    #error
XPath:       "not(f:link) or f:active"


Invariant: ihe-pcc-comp-1
Description: "Either section.entry or emptyReason are present"
* severity = #error
* expression = "(entry.reference.exists() or emptyReason.exists())"
* xpath = "(/f:entry.reference and not /f:emptyReason) or (not(/f:emptyReason) and /f:entry.reference)"

Invariant:   ihe-pcc-person-name
Description: "Either Person.name.given and/or Person.name.family and/or Person.name.text SHALL be present or a Data Absent Reason Extension SHALL be present."
Expression:  "(family.exists() or given.exists() or text.exists()) xor extension.where(url='http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()"
Severity:    #error

Invariant: ihe-shall-time-high
Description: "If statusCode is aborted or completed then effectiveTime.high Shall be present and shall not be present otherwise"
* severity = #error
* expression = "(statusCode.code.exists(code=#aborted) or statusCode.code.exists(code=#completed) implies effectiveTime.high.exists() )"
//* xpath = "(/f:entry.reference and not /f:emptyReason) or (not(/f:emptyReason) and /f:entry.reference)"

Invariant: ihe-pcc-realmCode-1
Description: "If realmCode is present it SHOULD be UV"
* severity = #error
* expression = "realmCode.code.exists() implies realmCode.code.exists(value=#UV)"
//* xpath = "(/f:entry.reference and not /f:emptyReason) or (not(/f:emptyReason) and /f:entry.reference)"


Invariant: ihe-pcc-realmCode-2
Description: "If realmCode is US, then the templateId SHALL be both 1.3.6.1.4.1.19376.1.5.3.1.1.1 and 2.16.840.1.113883.10.20.3"
* severity = #error
* expression = "realmCode.code.exists(value=#US) implies templateId.us-realm.root.exists(value = 2.16.840.1.113883.10.20.22.1.1)"
//* xpath = "(/f:entry.reference and not /f:emptyReason) or (not(/f:emptyReason) and /f:entry.reference)"

Invariant: ihe-shall-problem-concern-act
Description: "If section/@nullFlavor is not present, SHALL contain at least one Problem Concern Entry"
* severity = #error
* expression = "nullFlavor.exists() or entry.where(act.hasTemplateIdOf('https://profiles.ihe.net/PCC/PSCc/StructureDefinition/IHE_Problem_Concern_Entry')).exists()"

Invariant: ihe-should-coverage-entry
Description: "If section/@nullFlavor is not present, SHOULD contain at least one Coverage Entry"
* severity = #warning
* expression = "nullFlavor.exists() or entry.where(act.hasTemplateIdOf('https://profiles.ihe.net/PCC/PSCc/StructureDefinition/IHE_PCC_CDA_Coverage_Entry')).exists()"


//Invariant: ihe-ap-combo
//Description: "This structuredBody **SHALL NOT** contain an Assessment and Plan Section (2.16.840.1.113883.10.20.22.2.9:2014-06-09) when either an Assessment Section (2.16.840.1.113883.10.20.22.2.8) or a Plan of Treatment Section (2.16.840.1.113883.10.20.22.2.10:2014-06-09) is present."
//* severity = #error
//* expression = "component.where(section.hasTemplateIdOf('http://hl7.org/cda/us/ccda/StructureDefinition/AssessmentandPlanSection')).exists() implies component.where(section.hasTemplateIdOf('http://hl7.org/cda/us/ccda/StructureDefinition/AssessmentSection') or section.hasTemplateIdOf('http://hl7.org/cda/us/ccda/StructureDefinition/PlanofTreatmentSection')).empty()"
// NOte: remove comented out info when template id's have been updated 

//Invariant: ihe-cc-rfv-combo
//Description: "This structuredBody **SHALL NOT** contain a Chief Complaint and Reason for Visit Section (2.16.840.1.113883.10.20.22.2.13) when either a Chief Complaint Section (1.3.6.1.4.1.19376.1.5.3.1.1.13.2.1) or a Reason for Visit Section (2.16.840.1.113883.10.20.22.2.12) is present."
//* severity = #error
//* expression = "component.where(section.hasTemplateIdOf('http://hl7.org/cda/us/ccda/StructureDefinition/ChiefComplaintandReasonforVisitSection')).exists() implies component.where(section.hasTemplateIdOf('http://hl7.org/cda/us/ccda/StructureDefinition/ChiefComplaintSection') or section.hasTemplateIdOf('http://hl7.org/cda/us/ccda/StructureDefinition/ReasonforVisitSection')).empty()"
// NOte: remove comented out info when template id's have been updated 


//Invariant: ihe-should-section-hpi
//Description: "SHOULD contain a History of Present Illness Section"
//* severity = #warning
//* expression = "component.where(section.hasTemplateIdOf('http://hl7.org/cda/us/ccda/StructureDefinition/HistoryofPresentIllnessSection'))"
// NOte: remove comented out info when template id's have been updated 





// Pulled over hl7 invarients 
Invariant: value-starts-octothorpe
Description: "If reference/@value is present, it SHALL begin with a '#' and SHALL point to its corresponding narrative"
* severity = #error
* expression = "value.exists() implies value.startsWith('#')"

Invariant: should-text-ref-value
Description: "SHOULD contain text/reference/@value"
* severity = #warning
* expression = "text.reference.value.exists()"

Invariant: should-author
Description: "SHOULD contain author"
* severity = #warning
* expression = "author.exists()"

Invariant: 4537-17139
Description: "When the Subscriber is the patient (COV participant code = 'SELF'), the participant element describing the subscriber **SHALL NOT** be present. This information will be recorded instead in the data elements used to record member information (CONF:4537-17139)."
* severity = #error
* expression = "participant.where(typeCode='COV').participantRole.code.where(code = 'SELF').exists() implies participant.where(typeCode='HLD').empty()"

Invariant: should-code
Description: "SHOULD contain code"
* severity = #warning
* expression = "code.exists()"

Invariant: should-representedOrganization
Description: "SHOULD contain representedOrganization"
* severity = #warning
* expression = "representedOrganization.exists()"

Invariant: should-name
Description: "SHOULD contain name"
* severity = #warning
* expression = "name.exists()"

Invariant: should-time
Description: "SHOULD contain time"
* severity = #warning
* expression = "time.exists()"

Invariant: 4537-8967
Description: "**SHOULD** include assignedEntity/assignedPerson/name AND/OR assignedEntity/representedOrganization/name (CONF:4537-8967)."
* severity = #warning
* expression = "assignedPerson.name.exists() or representedOrganization.name.exists()"

Invariant: should-addr
Description: "SHOULD contain addr"
* severity = #warning
* expression = "addr.exists()"

Invariant: should-telecom
Description: "SHOULD contain telecom"
* severity = #warning
* expression = "telecom.exists()"

Invariant: should-low
Description: "SHOULD contain low"
* severity = #warning
* expression = "low.exists()"

Invariant: should-high
Description: "SHOULD contain high"
* severity = #warning
* expression = "high.exists()"

Invariant: should-playingEntity
Description: "SHOULD contain playingEntity"
* severity = #warning
* expression = "playingEntity.exists()"

Invariant: should-code-attr
Description: "SHOULD contain @code"
* severity = #warning
* expression = "code.exists()"



// 81-7278

