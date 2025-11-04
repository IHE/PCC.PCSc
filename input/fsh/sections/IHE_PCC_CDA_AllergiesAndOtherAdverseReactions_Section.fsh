Profile: IHE_PCC_CDA_AllergiesAndOtherAdverseReactions_Section
Parent: $Section
Id: IHE.PCC.CDA.AllergiesAndOtherAdverseReactions.Section
Title: "Allergies And Other Adverse Reactions Section"
Description: """
The adverse and other adverse reactions section shall contain a narrative description of the substance intolerances and the associated adverse reactions suffered by the patient. It shall include entries for intolerances and adverse reactions as described in the Entry Content Modules.

TBD- IF more modeled after CCDA AllergiesAndIntolerancesSection structure 
"""
* ^status = #draft
* obeys shall-allergy-concern
//* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"


* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "root"
* templateId ^slicing.discriminator[+].type = #value
* templateId ^slicing.discriminator[=].path = "extension"
* templateId ^slicing.rules = #open
* templateId contains 
    astm-parent 1..1 and 
    ihe-allergies-section 1..1 
* templateId[astm-parent].root 1..
* templateId[astm-parent].root = "2.16.840.1.113883.10.20.1.2"
* templateId[ihe-allergies-section].root 1..
* templateId[ihe-allergies-section].root = "1.3.6.1.4.1.19376.1.5.3.1.3.13"

* code 1..1
* code ^short = "Allergies and adverse reactions Document"
* code.code 1..
* code.code = #48765-2
* code.codeSystem 1..1
* code.codeSystem = "2.16.840.1.113883.6.1"

* title 1..1
* text 1..1
* entry ^slicing.discriminator[1].type = #profile
* entry ^slicing.discriminator[=].path = "act"
* entry ^slicing.rules = #open
* entry ^short = "If section/@nullFlavor is not present:"
* entry contains allergyConcern 1..* MS 
* entry[allergyConcern] ^comment = "SHALL contain at least one [1..*] entry (CONF:1198-7531) such that it"
* entry[allergyConcern].act 1..
* entry[allergyConcern].act only IHE_Allergies_And_Intolerances_Concern_Entry