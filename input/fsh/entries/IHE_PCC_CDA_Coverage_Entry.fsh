Profile: IHE_PCC_CDA_Coverage_Entry
Parent: $Act
Id: IHE.PCC.CDA.Coverage.Entry
Title: "Coverage Entry"
Description: """
A Coverage Activity groups the policy and authorization acts within a Payers Section to order the payment sources. A Coverage Activity contains one or more Policy Activities, each of which contains zero or more Authorization Activities. 
The sequenceNumber/@value shows the policy order of preference. 
The Member Identifier is described in the contained Policy Activity Template 2.16.840.1.113883.10.20.22.4.61.

^HL7 C_CDA description 

Payers shall be recorded as described in CCD: 3.1.2.1.1.
^IHE description 
"""


* ^status = #draft
* obeys should-text-ref-value and should-effectiveTime

* classCode = #ACT (exactly)
* classCode ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4537-8872)."

* moodCode = #EVN (exactly)
* moodCode ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4537-8873)."

* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "root"
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "extension"
* templateId ^slicing.rules = #open
* templateId contains 
    coverage-entry 1..1 and 
    coverage-act 1..1
* templateId[coverage-entry].root 1..
* templateId[coverage-entry].root = "1.3.6.1.4.1.19376.1.5.3.1.4.17"
* templateId[coverage-act].root 1..
* templateId[coverage-act].root = "2.16.840.1.113883.10.20.1.20"

* id 1..* MS 
* code ^short = "Payment sources"
* code.code 1..1
* code.code = #48768-6
* code.codeSystem 1..
* code.codeSystem = "2.16.840.1.113883.6.1"
* code.codeSystem ^short = "LOINC"

* statusCode 1..1
* statusCode ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4537-8875)."
* statusCode.code 1..1
* statusCode.code = #completed (exactly)
* statusCode.code ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:4537-19094)."

* text.reference obeys value-starts-octothorpe

* effectiveTime.value 0..1 MS 

* entryRelationship ^slicing.discriminator[+].type = #profile
* entryRelationship ^slicing.discriminator[=].path = "act"
* entryRelationship ^slicing.discriminator[+].type = #value
* entryRelationship ^slicing.discriminator[=].path = "typeCode"
* entryRelationship ^slicing.rules = #open
* entryRelationship contains payer-entries 1..*
* entryRelationship[payer-entries] ^short = "entryRelationship"
* entryRelationship[payer-entries] ^comment = "SHALL contain at least one [1..*] entryRelationship (CONF:4537-8878) such that it"
* entryRelationship[payer-entries].typeCode = #COMP (exactly)
* entryRelationship[payer-entries].typeCode ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" has component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:4537-8879)."
* entryRelationship[payer-entries].sequenceNumber ^comment = "MAY contain zero or one [0..1] sequenceNumber (CONF:4537-17174)."
* entryRelationship[payer-entries].sequenceNumber.value 1..1
* entryRelationship[payer-entries].act 1..1
* entryRelationship[payer-entries].act only IHE_PCC_CDA_Payers_Entry