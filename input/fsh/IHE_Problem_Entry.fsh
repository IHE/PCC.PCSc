Profile: IHE_PCC_Problem_Entry
Parent: $Observation
Id: IHE.PCC.Problem.Entry
Title: "Problem Entry"
Description: """
This section makes use of the linking, severity, clinical status and comment content specifications defined elsewhere in the technical framework. In HL7 RIM parlance, observations about a problem, complaint, symptom, finding, diagnosis, or functional limitation of a patient is the event (moodCode='EVN') of observing (<observation classCode='OBS'>) that problem. The <value> of the observation comes from a controlled vocabulary representing such things. The <code> contained within the <observation> describes the method of determination from yet another controlled vocabulary. An example appears below in the figure below

The basic pattern for reporting a problem uses the CDA <observation> element, setting the classCode='OBS' to represent that this is an observation of a problem, and the moodCode='EVN', to represent that this is an observation that has in fact taken place. The negationInd attribute, if true, specifies that the problem indicated was observed to not have occurred (which is subtly but importantly different from having not been observed).

The value of negationInd should not normally be set to true. Instead, to record that there is 'no prior history of chicken pox', one would use a coded value indicated exactly that. However, it is not always possible to record problems in this manner, especially if using a controlled vocabulary that does not supply pre-coordinated negations, or which do not allow the negation to be recorded with post-coordinated coded terminology. 


TBD for more
"""

//* ^identifier.system = "urn:ietf:rfc:3986"
//* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2024-05-01"
* ^status = #draft
* obeys should-text-ref-value and should-author

* moodCode = #EVN (exactly)
* moodCode ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-9042)."

//* classCode = #OBS (exactly)
//* classCode ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-9041)."
// confirm ^ class code is a strict contraint 

* templateId 2..* MS 
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "root"
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "extension"
* templateId ^slicing.rules = #open
* templateId contains 
    problem-obs 1..1 and 
    problem-entry 1..1 
* templateId[problem-obs].root 1..1
* templateId[problem-obs].root = "2.16.840.1.113883.10.20.1.28"
* templateId[problem-entry].root 1..1
* templateId[problem-entry].root = "1.3.6.1.4.1.19376.1.5.3.1.4.5"

* negationInd MS 
* negationInd ^short = "The negationInd is used to indicate the absence of the condition in observation/value. A negationInd of \"true\" coupled with an observation/value of SNOMED code 64572001 \"Disease (disorder)\" indicates that the patient has no known conditions."
* negationInd ^comment = "MAY contain zero or one [0..1] @negationInd (CONF:1198-10139)."

* id 1..* MS 
* id ^comment = "SHALL contain at least one [1..*] id (CONF:1198-9043)."

* code MS 
* code = $loinc#48767-8
* code ^comment = "The <code> describes the process of establishing a problem. The code element should be used, as the process of determining the value is important to clinicians (e.g., a diagnosis is a more advanced statement than a symptom). When a physical exam observation is being recorded the code used should be “Finding.” When a review of systems observation is being recorded the code used should be “Symptom.” The recommended vocabulary for describing problems is shown in the table below. Subclasses of this content module may specify other vocabularies. When the list below is used, the codeSystem is '2.16.840.1.113883.6.96' and codeSystemName is SNOMED CT."
//* code from $2.16.840.1.113762.1.4.1267.1 (preferred)
// do i need to make a vlaue set for the code reference to indicate that SNOMEDCT may be used aswell or is this just a comment?

* text 1..1 MS 
* text.reference obeys value-starts-octothorpe
* text ^short = "SHOULD reference the portion of section narrative text corresponding to this entry"
* text ^comment = "The <text> element is required and points to the text describing the problem being recorded; including any dates, comments, et cetera. The <reference> contains a URI in value attribute. This URI points to the free text description of the problem in the document that is being described."

* statusCode 1..1
* statusCode ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-9049)."
* statusCode.code 1..
* statusCode.code = #completed (exactly)
* statusCode.code ^comment = "A clinical document normally records only those condition observation events that have been completed, not observations that are in any other state. Therefore, the <statusCode> shall always have code='completed'."

* effectiveTime MS 
* effectiveTime ^short = "If the problem is known to be resolved, but the date of resolution is not known, then the high element **SHALL** be present, and the nullFlavor attribute **SHALL** be set to 'UNK'. Therefore, the existence of a high element within a problem does indicate that the problem has been resolved."
* effectiveTime ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1198-9050)."
* effectiveTime.low 1..1 MS 
* effectiveTime.low ^short = "The effectiveTime/low (a.k.a. \"onset date\") asserts when the condition became biologically active."
* effectiveTime.low ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-15603)."
* effectiveTime.high MS 

* value 1..* MS 
* value only $CD
* value ^comment = "The <value> is the condition that was found. This element is required. While the value may be a coded or an un-coded string, the type is always a coded value (xsi:type='CD'). If coded, the code and codeSystem attributes shall be present. The codeSystem should reference a controlled vocabulary describing problems, complaints, symptoms, findings, diagnoses, or functional limitations, e.g., ICD-9, SNOMED-CT or MEDCIN, or others."
* value.code ^short = "A negationInd of \"true\" coupled with an observation/value/@code of SNOMED code 64572001 \"Disease (disorder)\" indicates that the patient has no known conditions.  When the Problem is Social Determinant of Health Observation, the observation/value SHOULD be a SNOMED code selected from ValueSet Social Determinant of Health Conditions 2.16.840.1.113762.1.4.1196.788 DYNAMIC (CONF:4515-32951)."
* value.code ^comment = "This value MAY contain zero or one [0..1] @code (CONF:1198-31871)."
* value.qualifier ^short = "The observation/value and all the qualifiers together (often referred to as a post-coordinated expression) make up one concept. Qualifiers constrain the meaning of the primary code, and cannot negate it or change its meaning. Qualifiers can only be used according to well-defined rules of post-coordination and only if the underlying code system defines the use of such qualifiers or if there is a third code system that specifies how other code systems may be combined.\n\n In cases where SNOMED CT does not have a precoordinated code that would be appropriate for the problem list, concept post coordination may be used in CDA following the principles outlined in HL7 Version 3 Implementation Guide: TermInfo -\nUsing SNOMED CT in CDA R2 Models, Release 1 using the V3 CD Data type 1 style.  This is shown in the sample XML."
* value.qualifier ^comment = "This value MAY contain zero or more [0..*] qualifier (CONF:1198-31870)."

//* author only $AuthorParticipation
//* author ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-31147)."
// Is this a US Centric constraint?

* entryRelationship MS 
* entryRelationship ^slicing.discriminator[+].type = #profile
* entryRelationship ^slicing.discriminator[=].path = "observation"
* entryRelationship ^slicing.discriminator[+].type = #profile
* entryRelationship ^slicing.discriminator[=].path = "act"
* entryRelationship ^slicing.rules = #open
* entryRelationship contains
    severity-entry  0..1 MS and
    problem-status 0..1 MS and
    health-status 0..1 MS
* entryRelationship[severity-entry] ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1198-9059) such that it"
* entryRelationship[severity-entry].typeCode = #SUBJ (exactly)
* entryRelationship[severity-entry].inversionInd 1..
* entryRelationship[severity-entry].inversionInd = true (exactly)
* entryRelationship[severity-entry].inversionInd ^comment = "SHALL contain exactly one [1..1] @inversionInd=\"true\" True (CONF:1198-9069)."
* entryRelationship[severity-entry].observation 1..
* entryRelationship[severity-entry].observation only IHE_PCC_Severity_Entry

* entryRelationship[problem-status].typeCode = #REFR (exactly)
* entryRelationship[problem-status].typeCode ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-31531)."
* entryRelationship[problem-status].inversionInd = false (exactly)
* entryRelationship[problem-status].observation 1..
* entryRelationship[problem-status].observation only IHE_Problem_Status_Observation

* entryRelationship[health-status].typeCode = #REFR (exactly)
* entryRelationship[health-status].typeCode ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-31532)."
* entryRelationship[health-status].inversionInd = false (exactly)
* entryRelationship[health-status].observation 1..1 MS 
* entryRelationship[health-status].observation only IHE_Health_Status_Observation