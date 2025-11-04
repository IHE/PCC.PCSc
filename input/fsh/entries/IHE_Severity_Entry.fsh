Profile: IHE_PCC_Severity_Entry
Parent: $Observation
Id: IHE.PCC.Severity.Entry
Title: "Severity Entry"
Description: """
Any condition or allergy may be the subject of a severity observation. This structure is included in the target act using the <entryRelationship> element defined in the CDA Schema.

TBD for more
"""

//* ^identifier.system = "urn:ietf:rfc:3986"
//* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2024-05-01"
* ^status = #draft
* obeys should-text-ref-value and should-author

* moodCode = #EVN (exactly)
* moodCode ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-9042)."

* classCode = #OBS (exactly)
* classCode ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-9041)."

* templateId 2..* MS 
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "root"
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "extension"
* templateId ^slicing.rules = #open
* templateId contains 
    severity-obs 1..1 and 
    severity-entry 1..1 
* templateId[severity-obs].root 1..1
* templateId[severity-obs].root = "2.16.840.1.113883.10.20.1.55"
* templateId[severity-entry].root 1..1
* templateId[severity-entry].root = "1.3.6.1.4.1.19376.1.5.3.1.4.1"

* code ^comment = "This observation is of severity, as indicated by the <code> element listed above. This element is required."
* code.code 1..1 MS 
* code.code = #SEV
* code.codeSystem 1..1 
* code.codeSystem = "2.16.840.1.113883.5.4"
* code.codeSystem ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.5.4\" (CodeSystem: HL7ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-32170)."

* text 1..1 MS 
* text.reference 1..1 MS 
* text.reference obeys value-starts-octothorpe
* text ^short = "SHOULD reference the portion of section narrative text corresponding to this entry"
* text ^comment = "The <observation> element shall contain a <text> element. The <text> element shall contain a <reference> element pointing to the narrative where the severity is recorded."

* statusCode 1..1
* statusCode ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-7352)."
* statusCode.code 1..1
* statusCode.code = #completed (exactly)
* statusCode.code ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19115)."

* value MS 
* value only $CD
* value.code from Severity_Value_Code_VS (preferred)