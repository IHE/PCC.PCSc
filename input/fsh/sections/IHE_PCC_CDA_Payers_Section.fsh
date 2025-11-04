Profile: IHE_PCC_CDA_Payers_Section 
Parent: $Section
Id: IHE.PCC.CDA.Payers.Section
Title: "IHE Payers Section"
Description: """
The Payers section contains data on the patient’s payers, whether a ‘third party’ insurance, self-pay, other payer or guarantor, or some combination.
"""
//* ^identifier.system = "urn:ietf:rfc:3986"
//* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.5.1:2015-08-01"
* ^status = #draft

* obeys ihe-should-coverage-entry
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "root"
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "extension"
* templateId ^slicing.rules = #open
* templateId contains 
    ccdPayment 1..1 MS and 
    payersSection 1..1 MS
* templateId[ccdPayment].root 1..1 MS 
* templateId[ccdPayment].root = "2.16.840.1.113883.10.20.1.9"
* templateId[payersSection].root 1..1 MS 
* templateId[payersSection].root = "1.3.6.1.4.1.19376.1.5.3.1.1.5.3.7"

* code 1..1 MS 
* code ^short = "Payment Sources"
* code.code 1..1 MS 
* code.code = $loinc#48768-6
* code.codeSystem 1..1 MS 
* code.codeSystem = "2.16.840.1.113883.6.1"
* code.codeSystemName = "LOINC"

* title MS 
* text MS 
* entry ^slicing.discriminator[+].type = #profile
* entry ^slicing.discriminator[=].path = "act"
* entry ^slicing.discriminator[+].type = #profile
* entry ^slicing.discriminator[=].path = "observation"
* entry ^slicing.rules = #open
* entry ^short = "If section/@nullFlavor is not present:"
* entry ^comment = "SHALL contain at least one [1..*] entry (CONF:1198-9183)"
* entry contains coverage-Entry 0..* MS 

* entry[coverage-Entry].act only IHE_PCC_CDA_Coverage_Entry