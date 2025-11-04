Profile: IHE_Problem_Reaction_Entry
Parent: IHE_PCC_Problem_Entry
Id: IHE.Problem.Reaction.Entry
Title: "IHE Probelm Reaction Entry"
Description: """
TBD... 
"""
//* ^identifier.system = "urn:ietf:rfc:3986"
//* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.3:2024-05-01"
* ^status = #draft

* templateId contains allergy-int-reaction 1..1
* templateId[allergy-int-reaction].root 1..1
* templateId[allergy-int-reaction].root = "2.16.840.1.113883.10.20.1.54"
