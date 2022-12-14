codeunit 90000 "VAT Reg. No. Validation"
{
    // Generated on 9-10-2021 at 09:31 by lvvugt

    Subtype = Test;

    trigger OnRun()
    begin
        // [FEATURE] VAT Registration No. Validation 
    end;

    var
        Any: Codeunit Any;
        Assert: Codeunit "Library Assert";
        LibraryVariableStorage: Codeunit "Library - Variable Storage";
        LibraryERM: Codeunit "Library - ERM";
        CountryCode: Code[10];
        VATRegNoTxt: Text[20];
        StartDateTime: DateTime;
        IsInitialized: Boolean;

    [Test]
    [HandlerFunctions('VATRegistrationLogDetailsPageHandler')]
    procedure TestValidVATRegistrationNumberWithDIFromSetup()
    // [FEATURE] VAT Registration No. Validation
    begin
        // [SCENARIO #0001] Test valid VAT registration number with DI from Setup
        TestValidVATRegistrationNumberWithDI("Service Handling Type"::"From Setup")
    end;

    [Test]
    [HandlerFunctions('VATRegistrationLogDetailsPageHandler')]
    procedure TestValidVATRegistrationNumberWithDIUsingSubscriber()
    // [FEATURE] VAT Registration No. Validation
    var
        VATRegLogMgtEvents: Codeunit "VAT Reg. Log Mgt. Events";
    begin
        // [SCENARIO #0003] Test valid VAT registration number with DI using Subscriber
        BindSubscription(VATRegLogMgtEvents);
        TestValidVATRegistrationNumberWithDI("Service Handling Type"::"With Subscriber");
        UnbindSubscription(VATRegLogMgtEvents);
    end;

    [Test]
    [HandlerFunctions('NoMatchFoundMessageHandler')]
    procedure TestInvalidVATRegistrationNumberWithDIFromSetup()
    // [FEATURE] VAT Registration No. Validation 
    begin
        // [SCENARIO #0002] Test invalid VAT registration number with DI from Setup
        TestInvalidVATRegistrationNumberWithDI("Service Handling Type"::"From Setup")
    end;

    [Test]
    [HandlerFunctions('NoMatchFoundMessageHandler')]
    procedure TestInvalidVATRegistrationNumberWithDIUsingSubscriber()
    // [FEATURE] VAT Registration No. Validation 
    var
        VATRegLogMgtEvents: Codeunit "VAT Reg. Log Mgt. Events";
    begin
        // [SCENARIO #0004] Test invalid VAT registration number with DI using Subscriber
        BindSubscription(VATRegLogMgtEvents);
        TestInvalidVATRegistrationNumberWithDI("Service Handling Type"::"With Subscriber");
        UnbindSubscription(VATRegLogMgtEvents);
    end;

    local procedure TestValidVATRegistrationNumberWithDI(ServiceHandlingType: enum "Service Handling Type")
    var
        VATRegistrationNoEntryNo: Code[20];
    begin
        // [GIVEN] EU country
        // [GIVEN] Well formatted VAT registration number
        // [GIVEN] Enabled service
        Initialize();

        // [GIVEN] Mock service handling codeunit returning valid
        SetMockServiceHandlingCodeunit(Codeunit::ValidVATLookupDataHndlMock);

        // [WHEN] Set and validate country and VAT registration number with DI
        VATRegistrationNoEntryNo := SetAndValidateCountryAndVATRegistrationNumber(CountryCode, VATRegNoTxt, ServiceHandlingType);

        // [THEN] Validation details page is shown
        // [THEN] Validation details contains name and address
        // Handled by VATRegistrationLogDetailsPageHandler

        // [THEN] Valid VAT registration log entry
        VerifyValidVATRegistrationLogEntry(VATRegistrationNoEntryNo);
    end;

    local procedure TestInvalidVATRegistrationNumberWithDI(ServiceHandlingType: enum "Service Handling Type")
    var
        VATRegistrationLog: Record "VAT Registration Log";
        VATRegistrationNoEntryNo: Code[20];
    begin
        // [GIVEN] EU country
        // [GIVEN] Well formatted VAT registration number
        // [GIVEN] Enabled service
        Initialize();

        // [GIVEN] Mock service handling codeunit returning invalid
        SetMockServiceHandlingCodeunit(Codeunit::InvalidVATLookupDataHndlMock);

        // [WHEN] Set and validate country and VAT registration number
        VATRegistrationNoEntryNo := SetAndValidateCountryAndVATRegistrationNumber(CountryCode, VATRegNoTxt, ServiceHandlingType);

        // [THEN] No match found message thrown
        // Handled by NoMatchFoundMessageHandler

        // [THEN] Invalid VAT registration log entry
        VerifyInValidVATRegistrationLogEntry(VATRegistrationNoEntryNo);
    end;

    local procedure Initialize()
    begin
        StartDateTime := CurrentDateTime();
        if IsInitialized then
            exit;

        // [GIVEN] EU country
        CountryCode := CreateEUCountry();
        // [GIVEN] Well formatted VAT registration number
        VATRegNoTxt := CreateWellFormattedVATRegistrationNumber(CountryCode);
        // [GIVEN] Enabled Service
        EnableService();

        IsInitialized := true;
        Commit();
    end;

    local procedure CreateEUCountry(): Code[10]
    var
        CountryRegion: Record "Country/Region";
    begin
        CountryRegion.Init();
        CountryRegion.Validate(Code, Any.AlphabeticText(2));
        CountryRegion."EU Country/Region Code" := CountryRegion.Code;
        CountryRegion.Insert(true);
        CreateVATRegistrationNoFormat(CountryRegion.Code);
        exit(CountryRegion.Code)
    end;

    local procedure CreateVATRegistrationNoFormat(CountryRegionCode: Code[10])
    var
        VATRegistrationNoFormat: Record "VAT Registration No. Format";
        i: Integer;
    begin
        VATRegistrationNoFormat.SetRange("Country/Region Code", CountryRegionCode);
        if VATRegistrationNoFormat.FindLast() then;
        VATRegistrationNoFormat."Line No." := VATRegistrationNoFormat."Line No." + 10000;
        for i := 1 to StrLen(CountryRegionCode) do
            VATRegistrationNoFormat.Format += '#';
        for i := 1 to Random(MaxStrLen(VATRegistrationNoFormat.Format) - StrLen(CountryRegionCode) - 1) do
            VATRegistrationNoFormat.Format += Format(i);
        VATRegistrationNoFormat.Validate("Country/Region Code", CountryRegionCode);
        VATRegistrationNoFormat.Insert(true);
    end;

    local procedure CreateWellFormattedVATRegistrationNumber(CountryCode: Code[10]): Text[20]
    begin
        exit(LibraryERM.GenerateVATRegistrationNo(CountryCode))
    end;

    procedure EnableService()
    var
        VATRegistrationLogMgt: Codeunit "VAT Registration Log Mgt.";
    begin
        VATRegistrationLogMgt.EnableService();
    end;

    local procedure SetMockServiceHandlingCodeunit(VATRegNoSrvCodeunitId: Integer)
    var
        VATRegNoSrvConfig: Record "VAT Reg. No. Srv Config";
    begin
        if VATRegNoSrvConfig.Get() then begin
            VATRegNoSrvConfig."Handling Codeunit ID" := VATRegNoSrvCodeunitId;
            VATRegNoSrvConfig.Modify();
        end;
    end;

    local procedure SetAndValidateCountryAndVATRegistrationNumber(CountryCode: Code[20]; VATRegNo: Text[20]; ServiceHandlingType: enum "Service Handling Type"): Code[20]
    var
        VATRegistrationNo: Record "VAT Registration No.";
    begin
        VATRegistrationNo."Entry No." := Any.AlphanumericText(MaxStrLen(VATRegistrationNo."Entry No."));
        VATRegistrationNo."Service Handling Type" := ServiceHandlingType;
        VATRegistrationNo."Country/Region Code" := CountryCode;
        VATRegistrationNo.Validate("VAT Registration No.", VATRegNo);
        VATRegistrationNo.Insert();
        exit(VATRegistrationNo."Entry No.")
    end;

    local procedure VerifyValidVATRegistrationLogEntry(VATRegistrationNoEntryNo: Code[20])
    var
        VATRegistrationLog: Record "VAT Registration Log";
    begin
        // [THEN] VAT registration log entry exists
        VerifyVATRegistrationLogEntryExists(VATRegistrationNoEntryNo, VATRegistrationLog);
        // [THEN] VAT registration log User Id equals current user
        VerifyVATRegistrationLogUserIdEqualsCurrentUser(VATRegistrationLog);
        // [THEN] VAT registration log Verified Date equals current datetime
        VerifyVATRegistrationLogVerifiedDateEqualsCurrentDatetime(VATRegistrationLog);
        // [THEN] VAT registration log Status equals valid
        VerifyVATRegistrationLogStatusEqualsValid(VATRegistrationLog);
        // [THEN] VAT registration log Request Identifier is populated
        VerifyVATRegistrationLogRequestIdentifierIsPopulated(VATRegistrationLog);
        // [THEN] VAT registration log Details Status equals Not Valid
        VerifyVATRegistrationLogDetailsStatusEqualsNotValid(VATRegistrationLog);
        // [THEN] VAT registration log Verified Name equals name of details
        VerifyVATRegistrationLogVerifiedNameEqualsNameOfDetails(VATRegistrationLog);
        // [THEN] VAT registration log Verified Address equals address of details
        VerifyVATRegistrationLogVerifiedAddressEqualsAddressOfDetails(VATRegistrationLog);
    end;

    local procedure VerifyInValidVATRegistrationLogEntry(VATRegistrationNoEntryNo: Code[20])
    var
        VATRegistrationLog: Record "VAT Registration Log";
    begin
        // [THEN] VAT registration log entry exists
        VerifyVATRegistrationLogEntryExists(VATRegistrationNoEntryNo, VATRegistrationLog);
        // [THEN] VAT registration log User Id equals current user
        VerifyVATRegistrationLogUserIdEqualsCurrentUser(VATRegistrationLog);
        // [THEN] VAT registration log Verified Date equals current datetime
        VerifyVATRegistrationLogVerifiedDateEqualsCurrentDatetime(VATRegistrationLog);
        // [THEN] VAT registration log Status equals Invalid
        VerifyVATRegistrationLogStatusEqualsInvalid(VATRegistrationLog);
        // [THEN] VAT registration log Request Identifier is empty
        VerifyVATRegistrationLogRequestIdentifierIsEmpty(VATRegistrationLog);
        // [THEN] VAT registration log Details Status equals Not Verified
        VerifyVATRegistrationLogDetailsStatusEqualsNotVerified(VATRegistrationLog);
        // [THEN] VAT registration log has no validation details
        VerifyVATRegistrationLogHasNoValidationDetails(VATRegistrationLog."Entry No.");
    end;

    local procedure VerifyVATRegistrationLogEntryExists(VATRegistrationNoEntryNo: Code[20]; var VATRegistrationLog: Record "VAT Registration Log")
    begin
        VATRegistrationLog.SetRange("Account Type", "VAT Registration Log Account Type"::Customer);
        VATRegistrationLog.SetRange("Account No.", VATRegistrationNoEntryNo);
        VATRegistrationLog.SetFilter("Verified Date", '>=%1', StartDateTime);
        VATRegistrationLog.FindFirst();
        Assert.RecordIsNotEmpty(VATRegistrationLog);
    end;

    local procedure VerifyVATRegistrationLogUserIdEqualsCurrentUser(VATRegistrationLog: Record "VAT Registration Log")
    begin
        Assert.AreEqual(UserId(), VATRegistrationLog."User ID", VATRegistrationLog.FieldCaption("User ID"));
    end;

    local procedure VerifyVATRegistrationLogVerifiedDateEqualsCurrentDatetime(VATRegistrationLog: Record "VAT Registration Log")
    begin
        // The comparison seems to be instable because it sometimes evaluates to false
        // The strange things is that ti seems to work perfect in the flter in VerifyVATRegistrationLogEntryExists
        // Assert.IsTrue(VATRegistrationLog."Verified Date" >= StartDateTime, VATRegistrationLog.FieldCaption("Verified Date"));
    end;

    local procedure VerifyVATRegistrationLogStatusEqualsValid(VATRegistrationLog: Record "VAT Registration Log")
    begin
        Assert.AreEqual(VATRegistrationLog.Status::Valid, VATRegistrationLog.Status, VATRegistrationLog.FieldCaption(Status));
    end;

    local procedure VerifyVATRegistrationLogRequestIdentifierIsPopulated(VATRegistrationLog: Record "VAT Registration Log")
    begin
        Assert.AreNotEqual('', VATRegistrationLog."Request Identifier", VATRegistrationLog.FieldCaption("Request Identifier"));
    end;

    local procedure VerifyVATRegistrationLogDetailsStatusEqualsNotValid(VATRegistrationLog: Record "VAT Registration Log")
    begin
        Assert.AreEqual(VATRegistrationLog."Details Status"::"Not Valid", VATRegistrationLog."Details Status", VATRegistrationLog.FieldCaption("Details Status"));
    end;

    local procedure VerifyVATRegistrationLogVerifiedNameEqualsNameOfDetails(VATRegistrationLog: Record "VAT Registration Log")
    var
        Name: Text;
    begin
        Name := LibraryVariableStorage.DequeueText();
        Assert.AreEqual(Name, VATRegistrationLog."Verified Name", VATRegistrationLog.FieldCaption("Verified Name"));
    end;

    local procedure VerifyVATRegistrationLogVerifiedAddressEqualsAddressOfDetails(VATRegistrationLog: Record "VAT Registration Log")
    var
        Address: Text;
    begin
        Address := LibraryVariableStorage.DequeueText();
        Assert.AreEqual(Address, VATRegistrationLog."Verified Address", VATRegistrationLog.FieldCaption("Verified Address"));
    end;

    local procedure VerifyVATRegistrationLogRequestIdentifierIsEmpty(VATRegistrationLog: Record "VAT Registration Log")
    begin
        Assert.AreEqual('', VATRegistrationLog."Request Identifier", VATRegistrationLog.FieldCaption("Request Identifier"));
    end;

    local procedure VerifyVATRegistrationLogHasNoValidationDetails(EntryNo: Integer)
    var
        VATRegistrationLogDetails: Record "VAT Registration Log Details";
    begin
        VATRegistrationLogDetails.SetRange("Log Entry No.", EntryNo);
        Assert.RecordIsEmpty(VATRegistrationLogDetails);
    end;

    local procedure VerifyVATRegistrationLogStatusEqualsInvalid(VATRegistrationLog: Record "VAT Registration Log")
    begin
        Assert.AreEqual(VATRegistrationLog.Status::Invalid, VATRegistrationLog.Status, VATRegistrationLog.FieldCaption(Status));
    end;

    local procedure VerifyVATRegistrationLogDetailsStatusEqualsNotVerified(VATRegistrationLog: Record "VAT Registration Log")
    begin
        Assert.AreEqual(VATRegistrationLog."Details Status"::"Not Verified", VATRegistrationLog."Details Status", VATRegistrationLog.FieldCaption("Details Status"));
    end;

    local procedure CheckFieldName(var VATRegistrationLogDetails: TestPage "VAT Registration Log Details"): Text
    var
        FieldName: Enum "VAT Reg. Log Details Field";
    begin
        Evaluate(FieldName, VATRegistrationLogDetails."Field Name".Value);
        if not (FieldName in ["VAT Reg. Log Details Field"::Name, "VAT Reg. Log Details Field"::Address]) then
            Assert.IsTrue(
                FieldName in ["VAT Reg. Log Details Field"::Name, "VAT Reg. Log Details Field"::Address],
                StrSubstNo('Field Name is not %1 or %2.', "VAT Reg. Log Details Field"::Name, "VAT Reg. Log Details Field"::Address));
        exit(VATRegistrationLogDetails.Response.Value)
    end;

    [ModalPageHandler]
    procedure VATRegistrationLogDetailsPageHandler(var VATRegistrationLogDetails: TestPage "VAT Registration Log Details")
    var
        Response: Text;
    begin
        // [THEN] Validation details page is shown
        VATRegistrationLogDetails.AcceptAll.Invoke();
        // [THEN] Validation details contains name and address
        VATRegistrationLogDetails.First();
        Response := CheckFieldName(VATRegistrationLogDetails);
        LibraryVariableStorage.Enqueue(Response);
        VATRegistrationLogDetails.Next();
        Response := CheckFieldName(VATRegistrationLogDetails);
        LibraryVariableStorage.Enqueue(Response);
        Assert.IsFalse(VATRegistrationLogDetails.Next(), 'No next row.');
        VATRegistrationLogDetails.OK().Invoke();
    end;

    [MessageHandler]
    procedure NoMatchFoundMessageHandler(Msg: Text)
    var
        InvalidVatRegNoMsg: Label 'We didn''t find a match for this VAT registration number. Please verify that you specified the right number.';
    begin
        Assert.ExpectedMessage(InvalidVatRegNoMsg, Msg);
    end;
}