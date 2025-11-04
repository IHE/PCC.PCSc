Profile: IHE_PCC_CDA_Payers_Entry
Parent: $Act
Id: IHE.PCC.CDA.Payers.Entry
Title: "Payers Entry"
Description: """
The payer entry allows information about the patient's sources of payment to be recorded.

TBD if more
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
    payer-act 1..1 and 
    payers-entry 1..1
* templateId[payer-act].root 1..
* templateId[payer-act].root = "2.16.840.1.113883.10.20.1.26"
* templateId[payers-entry].root 1..
* templateId[payers-entry].root = "1.3.6.1.4.1.19376.1.5.3.1.4.18"

* id 1..1
* id ^comment = "If the root OID of Payer that assigned the identifier is unknown, a local OID can be assigned or a nullFlavor of UNK"

* code MS 
* code from ActCoverageTypeCode (preferred)
* code ^comment = "The <code> element should be present, and represents the type of coverage provided by the payer. Potential vocabularies to use include: HL7 ActCoverageType (2.16.840.1.113883.5.4) and X12 Data Element 1336 (2.16.840.1.113883.6.255.1336)"

* statusCode 1..1
* statusCode.code 1..1
* statusCode.code = #completed (exactly)

* text.reference obeys value-starts-octothorpe

* performer ^slicing.discriminator[+].type = #value
* performer ^slicing.discriminator[=].path = "templateId.root"
* performer ^slicing.rules = #open
* performer ^comment = "The <performer> element shall be present to represent the payer of the coverage."
* performer contains
    payer 1..1 and
    guarantor 0..*
* performer[payer] ^short = "This performer represents the Payer."
* performer[payer] ^comment = "SHALL contain exactly one [1..1] performer (CONF:4537-8906) such that it"
* performer[payer].typeCode 1..1
* performer[payer].typeCode.code = #PRF
* performer[payer].assignedEntity obeys should-code and should-representedOrganization
* performer[payer].assignedEntity ^comment = "SHALL contain exactly one [1..1] assignedEntity (CONF:4537-8908)."
* performer[payer].assignedEntity.classCode 1..1 MS 
* performer[payer].assignedEntity.id MS
* performer[payer].assignedEntity.code ^comment = "This assignedEntity SHOULD contain zero or one [0..1] code (CONF:4537-8914)."
* performer[payer].assignedEntity.code.nullFlavor 0..0
* performer[payer].assignedEntity.code.code 1..1 
* performer[payer].assignedEntity.code.code from Payer_Role_Codes_VS (extensible)
* performer[payer].assignedEntity.addr 1..1
* performer[payer].assignedEntity.addr obeys should-country
* performer[payer].assignedEntity.telecom.use 1..* MS 
* performer[payer].assignedEntity.telecom obeys should-use
* performer[payer].assignedEntity.representedOrganization.classCode 1.1 
* performer[payer].assignedEntity.representedOrganization obeys should-name
* performer[payer].assignedEntity.representedOrganization ^comment = "This assignedEntity SHOULD contain zero or one [0..1] representedOrganization (CONF:4537-8912)."
* performer[payer].assignedEntity.representedOrganization.name 1..1
* performer[payer].assignedEntity.representedOrganization.name ^comment = "The representedOrganization, if present, SHOULD contain zero or one [0..1] name (CONF:4537-8913)."

* performer[guarantor] obeys should-time
* performer[guarantor] ^short = "This performer represents the Guarantor."
* performer[guarantor].typeCode 1..1
* performer[guarantor].time ^comment = "SHOULD contain zero or one [0..1] time (CONF:4537-8963)."
* performer[guarantor].assignedEntity obeys 4537-8967 and should-addr and should-telecom
* performer[guarantor].assignedEntity ^comment = "SHALL contain exactly one [1..1] assignedEntity (CONF:4537-8962)."
* performer[guarantor].assignedEntity.code 1..
* performer[guarantor].assignedEntity.code ^comment = "This assignedEntity SHALL contain exactly one [1..1] code (CONF:4537-8968)."
* performer[guarantor].assignedEntity.code.code 1..
* performer[guarantor].assignedEntity.code.code = #GUAR
* performer[guarantor].assignedEntity.code.code ^comment = "This code SHALL contain exactly one [1..1] @code=\"GUAR\" Guarantor (CONF:4537-16096)."
* performer[guarantor].assignedEntity.code.codeSystem 1..
* performer[guarantor].assignedEntity.code.codeSystem = "2.16.840.1.113883.5.110"
* performer[guarantor].assignedEntity.code.codeSystem ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.5.110\" (CONF:4537-32165)."
* performer[guarantor].assignedEntity.addr ..1
* performer[guarantor].assignedEntity.addr obeys should-country
* performer[guarantor].assignedEntity.addr ^comment = "This assignedEntity SHOULD contain zero or one [0..1] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:4537-8964)."
* performer[guarantor].assignedEntity.telecom.use 1..* MS 
* performer[guarantor].assignedEntity.telecom obeys should-use

* participant ^slicing.discriminator[+].type = #value
* participant ^slicing.discriminator[=].path = "typeCode"
* participant ^slicing.rules = #open
* participant ^comment = "SHOULD contain zero or one [0..1] participant (CONF:4537-8934) such that it"
* participant contains
    member 1..1 and
    subscriber 0..1
* participant[member] obeys should-time
* participant[member] ^short = "participant"
* participant[member] ^comment = "SHALL contain exactly one [1..1] participant (CONF:4537-8916) such that it"
* participant[member].typeCode = #COV (exactly)
* participant[member].typeCode ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COV\" Coverage target (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:4537-8917)."
* participant[member].time obeys should-low and should-high
* participant[member].time ^short = "This records the policy coverage period or self-pay period."
* participant[member].time ^comment = "SHOULD contain zero or one [0..1] time (CONF:4537-8918)."
* participant[member].time.low ^comment = "The time, if present, SHOULD contain zero or one [0..1] low (CONF:4537-8919)."
* participant[member].time.high ^short = "SHOULD contain high"
* participant[member].time.high ^comment = "The time, if present, SHOULD contain zero or one [0..1] high (CONF:4537-8920)."
* participant[member].participantRole obeys should-addr and should-playingEntity
* participant[member].participantRole ^comment = "SHALL contain exactly one [1..1] participantRole (CONF:4537-8921)."
* participant[member].participantRole.id 1..* MS 
* participant[member].participantRole.id ^comment = "This participantRole SHALL contain at least one [1..*] id (CONF:4537-8922)."
* participant[member].participantRole.code 1..1 MS 
* participant[member].participantRole.code obeys should-code-attr
* participant[member].participantRole.code.code from Payer_Role_Codes_VS (extensible)
* participant[member].participantRole.addr 1..1 MS 
* participant[member].participantRole.addr obeys should-country
* participant[member].participantRole.telecom obeys should-use
* participant[member].participantRole.telecomuse 1..* MS 
* participant[member].participantRole.playingEntity ^short = "This playingEntity records the covered party name and birthTime as represented by the health plan. This could match the information in recordTarget, or be different due to marriage or other reasons."
* participant[member].participantRole.playingEntity ^comment = "This participantRole SHOULD contain zero or one [0..1] playingEntity (CONF:4537-8932)."
* participant[member].participantRole.playingEntity.name 1..1
* participant[member].participantRole.playingEntity.name ^comment = "The playingEntity, if present, SHALL contain exactly one [1..1] name (CONF:4537-8930)."
* participant[member].participantRole.playingEntity.sdtcBirthTime 1..1
* participant[member].participantRole.playingEntity.sdtcBirthTime ^short = "sdtc:birthTime"
* participant[member].participantRole.playingEntity.sdtcBirthTime ^comment = "The playingEntity, if present, SHALL contain exactly one [1..1] sdtc:birthTime (CONF:4537-31344)."
* participant[subscriber] ^short = "When the Subscriber is the patient, the participant element describing the subscriber *SHALL NOT* be present. This information will be recorded instead in the data elements used to record member information."
* participant[subscriber].typeCode = #HLD (exactly)
* participant[subscriber].typeCode ^comment = "SHALL contain exactly one [1..1] @typeCode=\"HLD\" Holder (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:4537-8935)."
* participant[subscriber].time ^comment = "MAY contain zero or one [0..1] time (CONF:4537-8938)."
* participant[subscriber].participantRole obeys should-addr
* participant[subscriber].participantRole ^comment = "SHALL contain exactly one [1..1] participantRole (CONF:4537-8936)."
* participant[subscriber].participantRole.id 1..1 MS 
* participant[subscriber].participantRole.id ^comment = "This participantRole SHALL contain at least one [1..*] id (CONF:4537-8937)."
* participant[subscriber].participantRole.addr 1..1
* participant[subscriber].participantRole.addr obeys should-country
* participant[subscriber].participantRole.telecom obeys should-use
* participant[subscriber].participantRole.telecomuse 1..* MS 

* entryRelationship ^slicing.discriminator[+].type = #value
* entryRelationship ^slicing.discriminator[=].path = "act.moodCode"
* entryRelationship ^slicing.rules = #open
* entryRelationship contains plan 0..*
* entryRelationship[plan] ^short = "Represents the Coverage Plan"
* entryRelationship[plan].typeCode = #REFR (exactly)
* entryRelationship[plan].act 1..
* entryRelationship[plan].act ^comment = "A description of the coverage plan **SHALL** contain one or more act/id, to represent the plan identifier, and an act/text with the name of the plan (CONF:4537-8943)."
* entryRelationship[plan].act.classCode = #ACT (exactly)
* entryRelationship[plan].act.moodCode = #DEF (exactly)
* entryRelationship[plan].act.id 1..1
* entryRelationship[plan].act.id ^short = "Plan identifier"
* entryRelationship[plan].act.text 1..1
* entryRelationship[plan].act.text ^short = "Name of the plan"
