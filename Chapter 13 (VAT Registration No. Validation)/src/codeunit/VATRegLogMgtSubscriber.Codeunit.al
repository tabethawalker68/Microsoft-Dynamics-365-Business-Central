codeunit 60169 "VAT Reg. Log Mgt. Subscriber"
// abstracted from codeunit 249 "VAT Registration Log Mgt." and adjusted: added OnBeforeCheckVIESForVATNoCodeunit event
{
    Permissions = TableData "VAT Registration Log" = rimd;

    var
        DataTypeManagement: Codeunit "Data Type Management";
        ValidVATNoMsg: Label 'The specified VAT registration number is valid.';
        InvalidVatRegNoMsg: Label 'We didn''t find a match for this VAT registration number. Please verify that you specified the right number.';
        NotVerifiedVATRegMsg: Label 'We couldn''t verify the VAT registration number. Please try again later.';
        DetailsNotVerifiedMsg: Label 'The specified VAT registration number is valid.\The VAT VIES validation service did not provide additional details.';

    procedure ValidateVATRegNoWithVIES(var RecordRef: RecordRef; RecordVariant: Variant; EntryNo: Code[20]; AccountType: Option; CountryCode: Code[10])
    var
        VATRegistrationLog: Record "VAT Registration Log";
    begin
        CheckVIESForVATNo(RecordRef, VATRegistrationLog, RecordVariant, EntryNo, CountryCode, AccountType);

        if VATRegistrationLog.Find() then // Only update if the log was created
            UpdateRecordFromVATRegLog(RecordRef, RecordVariant, VATRegistrationLog);
    end;

    procedure CheckVIESForVATNo(var RecordRef: RecordRef; var VATRegistrationLog: Record "VAT Registration Log"; RecordVariant: Variant; EntryNo: Code[20]; CountryCode: Code[10]; AccountType: Option)
    var
        VATRegNo: Record "VAT Registration No.";
        VATRegNoSrvConfig: Record "VAT Reg. No. Srv Config";
        CountryRegion: Record "Country/Region";
        VatRegNoFieldRef: FieldRef;
        VATRegNoTxt: Text[20];
        IsHandled: Boolean;
        VATRegNoSrvCodeunitId: Integer;
    begin
        RecordRef.GetTable(RecordVariant);
        if not CountryRegion.IsEUCountry(CountryCode) then
            exit; // VAT Reg. check Srv. is only available for EU countries.

        if VATRegNoSrvConfig.VATRegNoSrvIsEnabled() then begin
            DataTypeManagement.GetRecordRef(RecordVariant, RecordRef);
            if not DataTypeManagement.FindFieldByName(RecordRef, VatRegNoFieldRef, VATRegNo.FieldName("VAT Registration No.")) then
                exit;
            VATRegNoTxt := VatRegNoFieldRef.Value;

            VATRegistrationLog.InitVATRegLog(VATRegistrationLog, CountryCode, AccountType, EntryNo, VATRegNoTxt);

            OnBeforeCheckVIESForVATNoCodeunit(VATRegNoSrvCodeunitId, IsHandled);
            if IsHandled then
                exit;

            if VATRegNoSrvCodeunitId <> 0 then
                Codeunit.Run(VATRegNoSrvCodeunitId, VATRegistrationLog)
            else
                Codeunit.Run(Codeunit::"VAT Lookup Ext. Data Hndl", VATRegistrationLog);
        end;
    end;

    procedure UpdateRecordFromVATRegLog(var RecordRef: RecordRef; RecordVariant: Variant; VATRegistrationLog: Record "VAT Registration Log")
    begin
        if GuiAllowed() then begin
            RecordRef.GetTable(RecordVariant);
            case VATRegistrationLog.Status of
                VATRegistrationLog.Status::Valid:
                    case VATRegistrationLog."Details Status" of
                        VATRegistrationLog."Details Status"::"Not Verified":
                            Message(DetailsNotVerifiedMsg);
                        VATRegistrationLog."Details Status"::Valid:
                            Message(ValidVATNoMsg);
                        VATRegistrationLog."Details Status"::"Partially Valid",
                        VATRegistrationLog."Details Status"::"Not Valid":
                            begin
                                DataTypeManagement.GetRecordRef(RecordVariant, RecordRef);
                                VATRegistrationLog.OpenDetailsForRecRef(RecordRef);
                            end;
                    end;
                VATRegistrationLog.Status::Invalid:
                    Message(InvalidVatRegNoMsg);
                else
                    Message(NotVerifiedVATRegMsg);
            end;
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckVIESForVATNoCodeunit(var VATRegNoSrvCodeunitId: Integer; var IsHandled: Boolean)
    begin
    end;
}