ValueSet: Severity_Value_Code_VS
Title: "Severity Value Code VS"
Description: "If coded, the Severity Entry value SHOULD use the HL7 SeverityObservation vocabulary (codeSystem='2.16.840.1.113883.5.1063') containing three values (H, M, and L), representing high, moderate and low severity depending upon whether the severity is life threatening, presents noticeable adverse consequences, or is unlikely substantially affect the situation of the subject."
Id: Severity.Value.Code.VS
* ^experimental = false
* $ObservationValue#L   "Low"
* $ObservationValue#H   "High"
* $ObservationValue#M   "Moderate"