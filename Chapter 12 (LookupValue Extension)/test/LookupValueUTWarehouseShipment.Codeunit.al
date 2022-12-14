codeunit 81023 "LookupValue UT Whse Shipment"
{
    // Generated on 5-8-2021 at 11:56 by lvanvugt

    Subtype = Test;

    trigger OnRun()
    begin
        // [FEATURE] LookupValue UT Warehouse Shipment
    end;

    var
        Assert: Codeunit "Library Assert";
        LibraryMessages: Codeunit "Library - Messages";

    [Test]
    procedure CheckInheritLookupValueFromSalesHeader()
    // [FEATURE] LookupValue UT Warehouse Shipment
    var
        SalesHeader: Record "Sales Header";
        WarehouseShipmentLine: Record "Warehouse Shipment Line";
    begin
        // [SCENARIO #0107] Check InheritLookupValueFromSalesHeader

        // [GIVEN] Sales header with lookup value
        SalesHeader."Lookup Value Code" := 'SC #0104';
        // [GIVEN] Warehouse shipment line
        // See local variable WarehouseShipmentLine

        // [WHEN] Trigger InheritLookupValueFromSalesHeader
        TriggerInheritLookupValueFromSalesHeader(WarehouseShipmentLine, SalesHeader);

        // [THEN] Lookup value on warehouse shipment line is populated with lookup value of sales header
        VerifyLookupValueOnWarehouseShipmentLine(WarehouseShipmentLine, SalesHeader."Lookup Value Code");
    end;

    local procedure TriggerInheritLookupValueFromSalesHeader(var WarehouseShipmentLine: Record "Warehouse Shipment Line"; SalesHeader: Record "Sales Header")
    var
        WhseCreateSourceDocumentEvents: Codeunit WhseCreateSourceDocumentEvents;
    begin
        WhseCreateSourceDocumentEvents.InheritLookupValueFromSalesHeader(WarehouseShipmentLine, SalesHeader);
    end;

    local procedure VerifyLookupValueOnWarehouseShipmentLine(WarehouseShipmentLine: Record "Warehouse Shipment Line"; LookupValueCode: Code[10])
    begin
        Assert.AreEqual(LookupValueCode, WarehouseShipmentLine."Lookup Value Code", LibraryMessages.GetFieldOnTableTxt(WarehouseShipmentLine.FieldCaption("Lookup Value Code"), WarehouseShipmentLine.TableCaption()));
    end;
}