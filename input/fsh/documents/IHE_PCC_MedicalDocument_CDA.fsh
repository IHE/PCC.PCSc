Profile: IHE_PCC_MedicalDocument_CDA
Parent: $ClinicalDocument
Id: IHE.PCC.MD.CDA
Title: "Medical Document"
Description: """
This Structure Definition defines the base set of constraints used by almost all medical document profiles described the PCC Technical Framework.
"""
//* ^identifier.system = "urn:ietf:rfc:3986"
//* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.1.1:2024-05-01"
* ^status = #draft
* obeys 4537-6380 and 4537-6387 and should-legalAuthenticator and should-relatedParticipant
* classCode 1..1 MS 
// how to express R, R2, RE, and O optinoality in this structure? via invarients? 

* realmCode 1..1
* realmCode ^comment = "SHALL contain at least one [1..1] realmCode=\" \". realmCode Should be UV"
* realmCode.code 1.. MS
//* realmCode.code ^comment = "SHALL contain exactly one [1..1] realmCode=\" \". realmCode Should be UV unless it is a USA implementain, then it SHALL be UV + US."
* realmCode.code obeys ihe-pcc-realmCode-1
// Conformance or invarient binding - All IHE documents SHALL have a uv-realm code of #uv. All US realm Implementation SHALL have both #uv and #US realm codes within the document

* typeId 1..1 MS 
* typeId.root ^comment = "This typeId SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.1.3\" (CONF:4537-5250)."
* typeId.extension ^comment = "This typeId SHALL contain exactly one [1..1] @extension=\"POCD_HD000040\" (CONF:4537-5251)."

* templateId 1..* MS 
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "root"
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "extension"
* templateId ^slicing.rules = #open
* templateId contains 
    uv-realm 1..1 MS and 
    us-realm 0..1
* templateId[uv-realm].root 1..
* templateId[uv-realm].root = "1.3.6.1.4.1.19376.1.5.3.1.1.1"
//* templateId[uv-realm].extension 1..
//* templateId[uv-realm].extension = "2025-10-31"
* templateId[us-realm].root 1..
* templateId[us-realm].root = "2.16.840.1.113883.10.20.22.1.1"
* templateId[us-realm].extension 1..
* templateId[us-realm].extension = "2024-05-01"
* templateId obeys ihe-pcc-realmCode-2

* id MS 
* id ^short = "**SHALL** be a globally unique identifier for the document (CONF:4537-9991)."
* id ^comment = "SHALL contain exactly one [1..1] id (CONF:4537-5363). The uniqueId can be formatted using the following XPath expression, where $docID in the expression below represents the identifier. concat($docID/@root, $docID/@extension)" 

* code ^short = "**SHALL** specify the particular kind of document (e.g., History and Physical, Discharge Summary, Progress Note) (CONF:4537-9992)."
* code ^comment = "SHALL contain exactly one [1..1] code (CONF:4537-5253)."
* code.nullFlavor MS 
* code.code 1..1 MS
* code.code ^comment = "The typeCode should be mapped from the ClinicalDocument/code element to a set of document type codes configured in the affinity domain. One suggested coding system to use for typeCode is LOINC, in which case the mapping step can be omitted."
* code.codeSystem 1..1 MS
* code.codeSystem = "2.16.840.1.113883.6.1"
* code.codeSystemName 1..1 MS 
* code.codeSystemName = "LOINC"
* code.displayName 1..1 MS

* sdtcCategory MS 
* sdtcCategory ^slicing.discriminator[+].type = #value
* sdtcCategory ^slicing.discriminator[=].path = "code"
* sdtcCategory ^slicing.discriminator[+].type = #value
* sdtcCategory ^slicing.discriminator[=].path = "codeSystem"
* sdtcCategory ^slicing.rules = #open
* sdtcCategory ^short = "Used to categorize the document type.."
* sdtcCategory contains documentType 0..* MS 
* sdtcCategory[documentType].code 1..1 MS 
* sdtcCategory[documentType].codeSystem 1..1 MS
* sdtcCategory[documentType].codeSystem = "2.16.840.1.113883.6.1"
* sdtcCategory[documentType].codeSystemName 1..1 MS
* sdtcCategory[documentType].codeSystemName = "LOINC"
* sdtcCategory[documentType].displayName 1..1 MS


* title 1..1
* title ^short = "The title can either be a locally defined name or the displayName corresponding to clinicalDocument/code"
* title ^comment = "SHALL contain exactly one [1..1] title (CONF:4537-5254)."

* effectiveTime MS 
* effectiveTime ^comment = "Times specified in clinical documents may be specified with a precision in fractional sections, and may contain a time zone offset. In the XDS Metadata, it can be precise to the second, and is always given in UTC, so the timezone offset if present must be added to the current time to obtain the UTC time."

* confidentialityCode.code MS 
* confidentialityCode.nullFlavor 0..0
* confidentialityCode.code from Confidentiality (preferred)

* languageCode 1..1 MS 
* languageCode ^comment = "SHALL contain exactly one [1..1] languageCode, which SHALL be selected from ValueSet AllLanguages https://www.hl7.org/fhir/valueset-all-languages.html (OID 2.16.840.1.113883.4.642.3.21) DYNAMIC."

* setId ^comment = "MAY contain zero or one [0..1] setId (CONF:4537-5261)."

* versionNumber ^comment = "MAY contain zero or one [0..1] versionNumber (CONF:4537-5264)."

* recordTarget MS 
* recordTarget ^short = "The recordTarget records the administrative and demographic data of the patient whose health information is described by the clinical document; each recordTarget must contain at least one patientRole element"
* recordTarget ^comment = "SHALL contain at least one [1..*] recordTarget (CONF:4537-5266)."
* recordTarget.patientRole MS 
* recordTarget.patientRole ^comment = "Such recordTargets SHALL contain exactly one [1..1] patientRole (CONF:4537-5267)."
* recordTarget.patientRole.id MS 
* recordTarget.patientRole.id ^comment = "This patientRole SHALL contain at least one [1..*] id (CONF:4537-5268)."
* recordTarget.patientRole.addr 1..* MS 
* recordTarget.patientRole.addr obeys should-country
* recordTarget.patientRole.telecom 1..* MS 
* recordTarget.patientRole.telecom obeys should-use
* recordTarget.patientRole.telecom.use 1..* MS 
* recordTarget.patientRole.patient 1..1 MS 
* recordTarget.patientRole.patient obeys 4537-32993 and 4537-21000 and should-us-addr and should-maritalStatusCode and should-us-languageCommunication
* recordTarget.patientRole.patient ^comment = "This patientRole SHALL contain exactly one [1..1] patient (CONF:4537-5283)."
* recordTarget.patientRole.patient.name 1..* MS 
//* recordTarget.patientRole.patient.name only $USRealmPatientNamePTNUSFIELDED
// ^ origional binding is there a decontrainded thing to review for this? should it just remain open as the base is deffine or do we need to make a duplication of this contraint?
* recordTarget.patientRole.patient.name obeys iti-pdqm-patname
// May be removed if other commetn is fulfilled 
* recordTarget.patientRole.patient.birthTime 1..1 MS 
* recordTarget.patientRole.patient.birthTime obeys ts-shall-year and ts-should-day
* recordTarget.patientRole.patient.sdtcDeceasedTime obeys should-value-att and ts-shall-year and ts-should-day
* recordTarget.patientRole.patient.sdtcDeceasedTime ^short = "Date of Death"

* recordTarget.patientRole.patient.guardian MS 
* recordTarget.patientRole.patient.guardian obeys should-us-code and should-us-addr and should-us-telecom
* recordTarget.patientRole.patient.guardian.code MS
* recordTarget.patientRole.patient.guardian.code from PersonalAndLegalRelationshipRoleType (preferred)
* recordTarget.patientRole.patient.guardian.addr MS 
* recordTarget.patientRole.patient.guardian.addr obeys should-country
//* recordTarget.patientRole.patient.guardian.addr only $USRealmAddress
//* recordTarget.patientRole.patient.guardian.addr ^comment = "The guardian, if present, SHOULD contain zero or more [0..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:4537-5359)."
* recordTarget.patientRole.patient.guardian.telecom MS 
* recordTarget.patientRole.patient.guardian.telecom obeys should-use
* recordTarget.patientRole.patient.guardian.telecom ^comment = "The guardian, if present, SHOULD contain zero or more [0..*] telecom (CONF:4537-5382)."
* recordTarget.patientRole.patient.guardian.telecom.use 1..* MS 
* recordTarget.patientRole.patient.guardian.guardianPerson 1..1 MS 
* recordTarget.patientRole.patient.guardian.guardianPerson ^comment = "The guardian, if present, SHALL contain exactly one [1..1] guardianPerson (CONF:4537-5385)."
* recordTarget.patientRole.patient.guardian.guardianPerson.name 1..* MS 
//* recordTarget.patientRole.patient.guardian.guardianPerson.name only $USRealmPersonNamePNUSFIELDED
//* recordTarget.patientRole.patient.guardian.guardianPerson.name ^comment = "This guardianPerson SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:4537-5386)."
// ^ origional binding is there a decontrainded thing to review for this? should it just remain open as the base is deffine or do we need to make a duplication of this contraint?
* recordTarget.patientRole.patient.guardian.guardianPerson.name obeys ihe-pcc-person-name
// May be removed if other commetn is fulfilled 

* recordTarget.patientRole.patient.birthplace ^comment = "This patient MAY contain zero or one [0..1] birthplace (CONF:4537-5395)."
* recordTarget.patientRole.patient.birthplace.place ^comment = "The birthplace, if present, SHALL contain exactly one [1..1] place (CONF:4537-5396)."
* recordTarget.patientRole.patient.birthplace.place.addr 1..1 MS 
* recordTarget.patientRole.patient.birthplace.place.addr obeys should-country
* recordTarget.patientRole.patient.birthplace.place.addr ^comment = "This place SHALL contain exactly one [1..1] addr (CONF:4537-5397)."
* recordTarget.patientRole.patient.birthplace.place.addr.item.country from Country2 (required)
* recordTarget.patientRole.patient.languageCommunication MS 
* recordTarget.patientRole.patient.languageCommunication obeys should-proficiencyLevelCode and should-preferenceInd
* recordTarget.patientRole.patient.languageCommunication.languageCode 1..1 MS
* recordTarget.patientRole.patient.languageCommunication.languageCode from Languages (required)

* recordTarget.patientRole.providerOrganization ^comment = "This patientRole MAY contain zero or one [0..1] providerOrganization (CONF:4537-5416)."
* recordTarget.patientRole.providerOrganization.id 1..* MS 
* recordTarget.patientRole.providerOrganization.id ^comment = "The providerOrganization, if present, SHALL contain at least one [1..*] id (CONF:4537-5417)."
* recordTarget.patientRole.providerOrganization.name 1..* MS 
* recordTarget.patientRole.providerOrganization.name ^comment = "The providerOrganization, if present, SHALL contain at least one [1..*] name (CONF:4537-5419)."
* recordTarget.patientRole.providerOrganization.telecom 1..*
* recordTarget.patientRole.providerOrganization.telecom obeys should-use
* recordTarget.patientRole.providerOrganization.addr 1..* MS 
* recordTarget.patientRole.providerOrganization.addr obeys should-country

* author ^short = "The author element represents the creator of the clinical document.  The author may be a device or a person."
* author ^comment = "SHALL contain at least one [1..*] author (CONF:4537-5444)."
* author.assignedAuthor obeys 4537-16790 and should-us-code
* author.assignedAuthor.id MS 
//* author.assignedAuthor.id ^slicing.discriminator[+].type = #value
//* author.assignedAuthor.id ^slicing.discriminator[=].path = "root"
//* author.assignedAuthor.id ^slicing.rules = #open
//* author.assignedAuthor.id ^comment = "This assignedAuthor SHOULD contain zero or one [0..1] id (CONF:4537-32882) such that it, This assignedAuthor SHALL contain at least one [1..*] id (CONF:4537-5449)."
//* author.assignedAuthor.id contains npi 0..1
//* author.assignedAuthor.id[npi] obeys should-extension
//* author.assignedAuthor.id[npi].nullFlavor ^short = "If NPI is unknown, set @nullFlavor to UNK"
//* author.assignedAuthor.id[npi].root 1..
//* author.assignedAuthor.id[npi].root = "2.16.840.1.113883.4.6"
//* author.assignedAuthor.id[npi].root ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.4.6\" National Provider Identifier (CONF:4537-32884)."
//* author.assignedAuthor.id[npi].extension ^comment = "SHOULD contain zero or one [0..1] @extension (CONF:4537-32885)."
// ^ is NPI a US only concept? if not then slice should remain but root ids should be removed
* author.assignedAuthor.code MS 
* author.assignedAuthor.code ^short = "Only if this assignedAuthor is an assignedPerson should the assignedAuthor contain a code."
* author.assignedAuthor.code ^comment = "This assignedAuthor SHOULD contain zero or one [0..1] code (CONF:4537-16787)."
* author.assignedAuthor.code.nullFlavor 0..0
* author.assignedAuthor.code.code 1..
* author.assignedAuthor.addr 1..* MS 
* author.assignedAuthor.addr obeys should-country
* author.assignedAuthor.telecom 1..* MS 
* author.assignedAuthor.telecom obeys should-use
* author.assignedAuthor.telecom ^comment = "This assignedAuthor SHALL contain at least one [1..*] telecom (CONF:4537-5428)."
* author.assignedAuthor.telecom.use MS 
* author.assignedAuthor.assignedPerson ^comment = "MAY contain assignedPerson"
* author.assignedAuthor.assignedPerson.name 1..* MS 
* author.assignedAuthor.assignedPerson.name obeys ihe-pcc-person-name
// review for other missing requirements or invarients

* author.assignedAuthor.assignedAuthoringDevice ^comment = "MAY contain assignedAuthoringDevice"
* author.assignedAuthor.assignedAuthoringDevice.manufacturerModelName 1..1 MS 
* author.assignedAuthor.assignedAuthoringDevice.manufacturerModelName ^comment = "The assignedAuthoringDevice, if present, SHALL contain exactly one [1..1] manufacturerModelName (CONF:4537-16784)."
* author.assignedAuthor.assignedAuthoringDevice.softwareName 1..1 MS 
* author.assignedAuthor.assignedAuthoringDevice.softwareName ^comment = "The assignedAuthoringDevice, if present, SHALL contain exactly one [1..1] softwareName (CONF:4537-16785)."

* dataEnterer ^short = "The dataEnterer element represents the person who transferred the content, written or dictated, into the clinical document. To clarify, an author provides the content found within the header or body of a document, subject to their own interpretation; a dataEnterer adds an author's information to the electronic system."
* dataEnterer ^comment = "MAY contain zero or one [0..1] dataEnterer (CONF:4537-5441)."
* dataEnterer.time MS 
* dataEnterer.assignedEntity MS 
* dataEnterer.assignedEntity ^comment = "The dataEnterer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:4537-5442)."
* dataEnterer.assignedEntity.id ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:4537-5443)."
//* dataEnterer.assignedEntity.id.root obeys should-npi
//* dataEnterer.assignedEntity.id.root ^comment = "Such ids SHOULD contain zero or one [0..1] @root=\"2.16.840.1.113883.4.6\" National Provider Identifier (CONF:4537-16821)."
//* dataEnterer.assignedEntity.code from $2.16.840.1.114222.4.11.1066 (preferred)
// Confirm NPI International concept 
* dataEnterer.assignedEntity.code ^comment = "This assignedEntity MAY contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:4537-32173)."
* dataEnterer.assignedEntity.addr 1..* MS 
* dataEnterer.assignedEntity.addr obeys should-country
* dataEnterer.assignedEntity.telecom 1..* MS 
* dataEnterer.assignedEntity.telecom obeys should-use
* dataEnterer.assignedEntity.telecom ^comment = "This assignedEntity SHALL contain at least one [1..*] telecom (CONF:4537-5466)."
* dataEnterer.assignedEntity.telecom.use MS 
* dataEnterer.assignedEntity.assignedPerson 1..1 MS 
* dataEnterer.assignedEntity.assignedPerson ^comment = "This assignedEntity SHALL contain exactly one [1..1] assignedPerson (CONF:4537-5469)."
* dataEnterer.assignedEntity.assignedPerson.name 1..* MS 
* dataEnterer.assignedEntity.assignedPerson.name obeys ihe-pcc-person-name
// confirm that is the only constraint
* dataEnterer.assignedEntity.assignedPerson.name ^comment = "This assignedPerson SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:4537-5470)."

* informant ^slicing.discriminator[+].type = #exists
* informant ^slicing.discriminator[=].path = "relatedEntity"
* informant ^slicing.discriminator[+].type = #exists
* informant ^slicing.discriminator[=].path = "assignedEntity"
* informant ^slicing.rules = #open
* informant ^comment = "MAY contain zero or more [0..*] informant (CONF:4537-31355) such that it"
* informant contains
    provider 0..* and
    non-provider 0..*
* informant[provider] ^short = "The informant element describes an information source for any content within the clinical document. This informant is constrained for use when the source of information is an assigned health care provider for the patient."
* informant[provider] ^comment = "MAY contain zero or more [0..*] informant (CONF:4537-8001) such that it"
* informant[provider].assignedEntity 1..
* informant[provider].assignedEntity ^comment = "SHALL contain exactly one [1..1] assignedEntity (CONF:4537-8002)."
* informant[provider].assignedEntity.id ^short = "If assignedEntity/id is a provider then this id, **SHOULD** include zero or one [0..1] id where id/@root =\"2.16.840.1.113883.4.6\" National Provider Identifier (CONF:4537-9946)."
* informant[provider].assignedEntity.id ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:4537-9945)."
* informant[provider].assignedEntity.code from NUCCProviderCodes (example)
* informant[provider].assignedEntity.addr 1..* MS 
* informant[provider].assignedEntity.addr obeys should-country
* informant[provider].assignedEntity.assignedPerson 1..1 MS 
* informant[provider].assignedEntity.assignedPerson ^comment = "This assignedEntity SHALL contain exactly one [1..1] assignedPerson (CONF:4537-8221)."
* informant[provider].assignedEntity.assignedPerson.name 1..* MS 
* informant[provider].assignedEntity.assignedPerson.name obeys ihe-pcc-person-name
* informant[provider].relatedEntity 0..0 
* informant[non-provider] ^short = "The informant element describes an information source (who is not a provider) for any content within the clinical document. This informant would be used when the source of information has a personal relationship with the patient or is the patient."
* informant[non-provider].assignedEntity 0..0
* informant[non-provider].relatedEntity 1..1 MS 
* informant[non-provider].relatedEntity ^comment = "SHALL contain exactly one [1..1] relatedEntity (CONF:4537-31356)."

* custodian MS 
* custodian ^short = "The custodian element represents the organization that is in charge of maintaining and is entrusted with the care of the document.\n\n  There is only one custodian per CDA document. Allowing that a CDA document may not represent the original form of the authenticated document, the custodian represents the steward of the original source document. The custodian may be the document originator, a health information exchange, or other responsible party."
* custodian ^comment = "SHALL contain exactly one [1..1] custodian (CONF:4537-5519)."
* custodian.assignedCustodian ^comment = "This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:4537-5520)."
* custodian.assignedCustodian.representedCustodianOrganization ^comment = "This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:4537-5521)."
* custodian.assignedCustodian.representedCustodianOrganization.id ^comment = "This representedCustodianOrganization SHALL contain at least one [1..*] id (CONF:4537-5522)."
* custodian.assignedCustodian.representedCustodianOrganization.name 1..1 MS 
* custodian.assignedCustodian.representedCustodianOrganization.name ^comment = "This representedCustodianOrganization SHALL contain exactly one [1..1] name (CONF:4537-5524)."
* custodian.assignedCustodian.representedCustodianOrganization.telecom 1..1 MS 
* custodian.assignedCustodian.representedCustodianOrganization.telecom obeys should-use
* custodian.assignedCustodian.representedCustodianOrganization.telecom ^comment = "This representedCustodianOrganization SHALL contain exactly one [1..1] telecom (CONF:4537-5525)."
* custodian.assignedCustodian.representedCustodianOrganization.telecom.use MS 
* custodian.assignedCustodian.representedCustodianOrganization.sdtcTelecom ^short = "The stdc:telecom extension can be used to provide additional telecom elements for the custodian organization."
* custodian.assignedCustodian.representedCustodianOrganization.addr 1..1 MS 
* custodian.assignedCustodian.representedCustodianOrganization.addr obeys should-country

* informationRecipient ^short = "The informationRecipient element records the intended recipient of the information at the time the document was created. In cases where the intended recipient of the document is the patient's health chart, set the receivedOrganization to the scoping organization for that chart."
* informationRecipient ^comment = "MAY contain zero or more [0..*] informationRecipient (CONF:4537-5565)."
* informationRecipient.intendedRecipient ^comment = "The informationRecipient, if present, SHALL contain exactly one [1..1] intendedRecipient (CONF:4537-5566)."
* informationRecipient.intendedRecipient.id ^comment = "This intendedRecipient MAY contain zero or more [0..*] id (CONF:4537-32399)."
* informationRecipient.intendedRecipient.informationRecipient ^comment = "This intendedRecipient MAY contain zero or one [0..1] informationRecipient (CONF:4537-5567)."
* informationRecipient.intendedRecipient.informationRecipient.name 1..* MS 
* informationRecipient.intendedRecipient.informationRecipient.name obeys ihe-pcc-person-name
* informationRecipient.intendedRecipient.receivedOrganization ^comment = "This intendedRecipient MAY contain zero or one [0..1] receivedOrganization (CONF:4537-5577)."
* informationRecipient.intendedRecipient.receivedOrganization.name 1..1
* informationRecipient.intendedRecipient.receivedOrganization.name ^comment = "The receivedOrganization, if present, SHALL contain exactly one [1..1] name (CONF:4537-5578)."

* legalAuthenticator MS 
* legalAuthenticator ^short = "The legalAuthenticator identifies the single person legally responsible for the document and must be present if the document has been legally authenticated. A clinical document that does not contain this element has not been legally authenticated. The act of legal authentication requires a certain privilege be granted to the legal authenticator depending upon local policy. Based on local practice, clinical documents may be released before legal authentication.  All clinical documents have the potential for legal authentication, given the appropriate credentials. Local policies MAY choose to delegate the function of legal authentication to a device or system that generates the clinical document. In these cases, the legal authenticator is a person accepting responsibility for the document, not the generating device or system. Note that the legal authenticator, if present, must be a person."
* legalAuthenticator ^comment = "SHOULD contain zero or one [0..1] legalAuthenticator (CONF:4537-5579)."
* legalAuthenticator.time MS 
* legalAuthenticator.signatureCode ^comment = "The legalAuthenticator, if present, SHALL contain exactly one [1..1] signatureCode (CONF:4537-5583)."
* legalAuthenticator.signatureCode.code 1..1 MS 
* legalAuthenticator.signatureCode.code = #S
* legalAuthenticator.signatureCode.code ^comment = "This signatureCode SHALL contain exactly one [1..1] @code=\"S\" (CodeSystem: HL7ParticipationSignature urn:oid:2.16.840.1.113883.5.89 STATIC) (CONF:4537-5584)."
* legalAuthenticator.sdtcSignatureText ^short = "The signature can be represented either inline or by reference according to the ED data type. Typical cases for CDA are:\n1) Electronic signature: this attribute can represent virtually any electronic signature scheme.\n2) Digital signature: this attribute can represent digital signatures by reference to a signature data block that is constructed in accordance to a digital signature standard, such as XML-DSIG, PKCS#7, PGP, etc.\n The sdtc:signatureText extension provides a location in CDA for a textual or multimedia depiction of the signature by which the participant endorses and accepts responsibility for his or her participation in the Act as specified in the Participation.typeCode. Details of what goes in the field are described in the HL7 CDA Digital Signature Standard balloted in Fall 2013."
* legalAuthenticator.sdtcSignatureText ^comment = "The legalAuthenticator, if present, MAY contain zero or one [0..1] sdtc:signatureText (CONF:4537-30810)."
* legalAuthenticator.assignedEntity ^comment = "The legalAuthenticator, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:4537-5585)."
* legalAuthenticator.assignedEntity.id ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:4537-5586)."
* legalAuthenticator.assignedEntity.addr 1..* MS 
* legalAuthenticator.assignedEntity.addr obeys should-country
* legalAuthenticator.assignedEntity.addr ^comment = "This assignedEntity SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:4537-5589)."
* legalAuthenticator.assignedEntity.telecom 1..* MS 
* legalAuthenticator.assignedEntity.telecom obeys should-use
* legalAuthenticator.assignedEntity.telecom ^comment = "This assignedEntity SHALL contain at least one [1..*] telecom (CONF:4537-5595)."
* legalAuthenticator.assignedEntity.telecom.use MS 
* legalAuthenticator.assignedEntity.assignedPerson 1..1 MS 
* legalAuthenticator.assignedEntity.assignedPerson ^comment = "This assignedEntity SHALL contain exactly one [1..1] assignedPerson (CONF:4537-5597)."
* legalAuthenticator.assignedEntity.assignedPerson.name 1..* MS 
* legalAuthenticator.assignedEntity.assignedPerson.name obeys ihe-pcc-person-name

* authenticator ^short = "The authenticator identifies a participant or participants who attest to the accuracy of the information in the document."
* authenticator.time MS 
* authenticator.signatureCode ^comment = "SHALL contain exactly one [1..1] signatureCode (CONF:4537-5610)."
* authenticator.signatureCode.code 1..1 MS 
* authenticator.signatureCode.code = #S
* authenticator.signatureCode.code ^comment = "This signatureCode SHALL contain exactly one [1..1] @code=\"S\" (CodeSystem: HL7ParticipationSignature urn:oid:2.16.840.1.113883.5.89 STATIC) (CONF:4537-5611)."
* authenticator.sdtcSignatureText ^short = "The signature can be represented either inline or by reference according to the ED data type. Typical cases for CDA are:\n1) Electronic signature: this attribute can represent virtually any electronic signature scheme.\n2) Digital signature: this attribute can represent digital signatures by reference to a signature data block that is constructed in accordance to a digital signature standard, such as XML-DSIG, PKCS#7, PGP, etc.\n The sdtc:signatureText extension provides a location in CDA for a textual or multimedia depiction of the signature by which the participant endorses and accepts responsibility for his or her participation in the Act as specified in the Participation.typeCode. Details of what goes in the field are described in the HL7 CDA Digital Signature Standard balloted in Fall of 2013."
* authenticator.sdtcSignatureText ^comment = "MAY contain zero or one [0..1] sdtc:signatureText (CONF:4537-30811)."
* authenticator.assignedEntity ^comment = "SHALL contain exactly one [1..1] assignedEntity (CONF:4537-5612)."
* authenticator.assignedEntity.id ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:4537-5613)."
* authenticator.assignedEntity.code.code ^comment = "The code, if present, MAY contain zero or one [0..1] @code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:4537-16826)."
* authenticator.assignedEntity.addr 1..* MS 
* authenticator.assignedEntity.addr obeys should-country
* authenticator.assignedEntity.telecom 1..* MS 
* authenticator.assignedEntity.telecom obeys should-use
* authenticator.assignedEntity.telecom ^comment = "This assignedEntity SHALL contain at least one [1..*] telecom (CONF:4537-5622)."
* authenticator.assignedEntity.telecom.use MS 
* authenticator.assignedEntity.assignedPerson 1..1 MS 
* authenticator.assignedEntity.assignedPerson ^comment = "This assignedEntity SHALL contain exactly one [1..1] assignedPerson (CONF:4537-5624)."
* authenticator.assignedEntity.assignedPerson.name 1..* MS 
* authenticator.assignedEntity.assignedPerson.name obeys ihe-pcc-person-name


* participant obeys 4537-10006
* participant ^short = "The participant element identifies supporting entities, including parents, relatives, caregivers, insurance policyholders, guarantors, and others related in some way to the patient. A supporting person or organization is an individual or an organization with a relationship to the patient. A supporting person who is playing multiple roles would be recorded in multiple participants (e.g., emergency contact and next-of-kin)."
* participant ^comment = "SHOULD contain zero or more [0..*] RelatedPerson participant"
* participant.time MS 
* participant.time ^comment = "MAY contain zero or one [0..1] time (CONF:4537-10004)."
* inFulfillmentOf ^short = "The inFulfillmentOf element represents orders that are fulfilled by this document such as a radiologists' report of an x-ray."
* inFulfillmentOf ^comment = "MAY contain zero or more [0..*] inFulfillmentOf (CONF:4537-9952)."
* inFulfillmentOf.order ^comment = "The inFulfillmentOf, if present, SHALL contain exactly one [1..1] order (CONF:4537-9953)."
* inFulfillmentOf.order.id MS 
* inFulfillmentOf.order.id ^comment = "This order SHALL contain at least one [1..*] id (CONF:4537-9954)."

* documentationOf ^comment = "MAY contain zero or more [0..*] documentationOf (CONF:4537-14835)."
* documentationOf.serviceEvent obeys should-us-performer
* documentationOf.serviceEvent ^short = "A serviceEvent represents the main act being documented, such as a colonoscopy or a cardiac stress study. In a provision of healthcare serviceEvent, the care providers, PCP, or other longitudinal providers, are recorded within the serviceEvent. If the document is about a single encounter, the providers associated can be recorded in the componentOf/encompassingEncounter template."
* documentationOf.serviceEvent ^comment = "The documentationOf, if present, SHALL contain exactly one [1..1] serviceEvent (CONF:4537-14836)."
* documentationOf.serviceEvent.effectiveTime 1..1 MS 
* documentationOf.serviceEvent.effectiveTime.low 1..1 MS 
* documentationOf.serviceEvent.effectiveTime.low ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:4537-14838)."
* documentationOf.serviceEvent.performer MS 
* documentationOf.serviceEvent.performer ^short = "The performer participant represents clinicians who actually and principally carry out the serviceEvent. In a transfer of care this represents the healthcare providers involved in the current or pertinent historical care of the patient. Preferably, the patient's key healthcare care team members would be listed, particularly their primary physician and any active consulting physicians, therapists, and counselors."
* documentationOf.serviceEvent.performer ^comment = "This serviceEvent SHOULD contain zero or more [0..*] performer (CONF:4537-14839)."
* documentationOf.serviceEvent.performer.functionCode MS 
* documentationOf.serviceEvent.performer.functionCode obeys should-code-attr
* documentationOf.serviceEvent.performer.functionCode ^comment = "The performer, if present, MAY contain zero or one [0..1] functionCode (CONF:4537-16818)."
* documentationOf.serviceEvent.performer.time MS 
* documentationOf.serviceEvent.performer.assignedEntity obeys should-us-code
* documentationOf.serviceEvent.performer.assignedEntity ^comment = "The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:4537-14841)."
* documentationOf.serviceEvent.performer.assignedEntity.id ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:4537-14846)."

* authorization ^short = "The authorization element represents information about the patient's consent. The type of consent is conveyed in consent/code. Consents in the header have been finalized (consent/statusCode must equal Completed) and should be on file. This specification does not address how 'Privacy Consent' is represented, but does not preclude the inclusion of 'Privacy Consent'. The authorization consent is used for referring to consents that are documented elsewhere in the EHR or medical record for a health condition and/or treatment that is described in the CDA document."
* authorization ^comment = "MAY contain zero or more [0..*] authorization (CONF:4537-16792) such that it"
* authorization.consent MS 
* authorization.consent ^comment = "SHALL contain exactly one [1..1] consent (CONF:4537-16793)."
* authorization.consent.id ^comment = "This consent MAY contain zero or more [0..*] id (CONF:4537-16794)."
* authorization.consent.code ^short = "The type of consent (e.g., a consent to perform the related serviceEvent) is conveyed in consent/code."
* authorization.consent.code ^comment = "This consent MAY contain zero or one [0..1] code (CONF:4537-16795)."
* authorization.consent.statusCode MS 
* authorization.consent.statusCode ^comment = "This consent SHALL contain exactly one [1..1] statusCode (CONF:4537-16797)."
* authorization.consent.statusCode.code ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4537-16798)."

* componentOf MS 
* componentOf ^short = "The encompassing encounter represents the setting of the clinical encounter during which the document act(s) or ServiceEvent(s) occurred. In order to represent providers associated with a specific encounter, they are recorded within the encompassingEncounter as participants. In a CCD, the encompassingEncounter may be used when documenting a specific encounter and its participants. All relevant encounters in a CCD may be listed in the encounters section."
* componentOf ^comment = "MAY contain zero or one [0..1] componentOf (CONF:4537-9955)."
* componentOf.encompassingEncounter obeys should-responsibleParty
* componentOf.encompassingEncounter ^comment = "The componentOf, if present, SHALL contain exactly one [1..1] encompassingEncounter (CONF:4537-9956)."
* componentOf.encompassingEncounter.id 1..1 MS 
* componentOf.encompassingEncounter.id ^comment = "This encompassingEncounter SHALL contain at least one [1..*] id (CONF:4537-9959)."
* componentOf.encompassingEncounter.effectiveTime MS 
* componentOf.encompassingEncounter.responsibleParty MS 
* componentOf.encompassingEncounter.responsibleParty obeys 1198-8348
* componentOf.encompassingEncounter.responsibleParty ^comment = "This encompassingEncounter SHOULD contain zero or one [0..1] responsibleParty (CONF:1198-8391)."
* componentOf.encompassingEncounter.responsibleParty ^short = "The responsibleParty element records only the party responsible for the encounter, not necessarily the entire episode of care."
* componentOf.encompassingEncounter.responsibleParty.assignedEntity MS 
* componentOf.encompassingEncounter.responsibleParty.assignedEntity obeys 1198-32905
* componentOf.encompassingEncounter.responsibleParty.assignedEntity ^comment = "The responsibleParty, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-32904)."
* componentOf.encompassingEncounter.encounterParticipant obeys 1198-8348
* componentOf.encompassingEncounter.encounterParticipant ^short = "The encounterParticipant elements represent only those participants in the encounter, not necessarily the entire episode of care."
* componentOf.encompassingEncounter.encounterParticipant ^comment = "This encompassingEncounter MAY contain zero or more [0..*] encounterParticipant (CONF:1198-8342)."
* componentOf.encompassingEncounter.location MS 
* componentOf.encompassingEncounter.location ^comment = "This encompassingEncounter MAY contain zero or one [0..1] location (CONF:1198-8344)."
