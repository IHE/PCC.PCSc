Profile: IHE_PCC_Comment_Entry
Parent: $Act
Id: IHE.PCC.Comment.Entry
Title: "Comments"
Description: """
This entry allows for a comment to be supplied with each entry. For CDA this structure is usually included in the target act using the <entryRelationship> element defined in the CDA Schema, but can also be used in the <component> element when the comment appears within an <organizer>. The example below shows recording a comment for an <entry>, and is used as context for the following sections. For HL7 Version 3 Messages, this relationship is represented with the element <sourceOf>, although the remainder of the typecodes and semantics are unchanged.

Any condition or allergy may be the subject of a comment.

"""

* ^status = #draft
* obeys should-text-ref-value and should-author


* classCode = #ACT (exactly)
* classCode ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-9425)."

* moodCode = #EVN (exactly)
* moodCode ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-9426)."


* templateId 2..* MS 
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "root"
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "extension"
* templateId ^slicing.rules = #open
* templateId contains 
    comment-activity 1..1 and 
    comment-entry 1..1 
* templateId[comment-activity].root 1..1
* templateId[comment-activity].root = "2.16.840.1.113883.10.20.1.40"
* templateId[comment-entry].root 1..1
* templateId[comment-entry].root = "1.3.6.1.4.1.19376.1.5.3.1.4.2"

* code ^comment = "SHALL contain exactly one [1..1] code (CONF:81-9428)."
* code.code 1..
* code.code = #48767-8
* code.code ^comment = "This code SHALL contain exactly one [1..1] @code=\"48767-8\" Annotation Comment (CONF:81-19159)."
* code.codeSystem 1..1
* code.codeSystem = "2.16.840.1.113883.6.1"
* code.codeSystem ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26501)."

* text 1..1 MS 
* text ^short = "SHOULD reference the portion of section narrative text corresponding to this entry"
* text ^comment = "SHALL contain exactly one [1..1] text (CONF:81-9430)."
* text.reference 1..1 MS 
* text.reference obeys value-starts-octothorpe
* text.reference ^comment = "This text SHALL contain exactly one [1..1] reference (CONF:81-15967)."
* text.reference.value 1..
* text.reference.value ^comment = "This reference SHALL contain exactly one [1..1] @value (CONF:81-15968)."

* author.time MS 
* author.assignedAuthor MS 
* author.assignedAuthor.id MS
* author.assignedAuthor.addr 1..* MS 
* author.assignedAuthor.telecom 1..* MS 
* author.assignedAuthorassignedPerson MS
* author.assignedAuthorassignedPerson.name 1..* MS 
* author.assignedAuthorrepresentedOrganization MS
* author.assignedAuthorrepresentedOrganization.name 1..* MS 