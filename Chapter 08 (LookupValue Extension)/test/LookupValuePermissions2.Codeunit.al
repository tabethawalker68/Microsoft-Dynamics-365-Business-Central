codeunit 81021 "LookupValue Permissions 2"
{
    Subtype = Test;

    trigger OnRun()
    begin
        //[FEATURE] LookupValue Permissions
    end;

    var
        Assert: Codeunit "Library Assert";
        LibraryLowerPermissions: Codeunit "Library - Lower Permissions";
        NotFoundOnPage: Label 'is not found on the page.';

    [Test]
    procedure CheckLookupValueOnBlanketSalesOrderWithoutPermissions()
    var
        BlanketSalesOrder: TestPage "Blanket Sales Order";
    begin
        //[SCENARIO #0300] Check lookup value on Blanket Sales Order without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Blanket Sales Order 
        BlanketSalesOrder.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnBlanketSalesOrder(BlanketSalesOrder);
    end;

    [Test]
    procedure CheckLookupValueOnBlanketSalesOrderWithPermissions()
    var
        BlanketSalesOrder: TestPage "Blanket Sales Order";
    begin
        //[SCENARIO #0301] Check lookup value on Blanket Sales Order with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Blanket Sales Order 
        BlanketSalesOrder.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnBlanketSalesOrder(BlanketSalesOrder);
    end;

    [Test]
    procedure CheckLookupValueOnBlanketSalesOrdersWithoutPermissions()
    var
        BlanketSalesOrders: TestPage "Blanket Sales Orders";
    begin
        //[SCENARIO #0302] Check lookup value on Blanket Sales Orders without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Blanket Sales Orders
        BlanketSalesOrders.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnBlanketSalesOrders(BlanketSalesOrders);
    end;

    [Test]
    procedure CheckLookupValueOnBlanketSalesOrdersWithPermissions()
    var
        BlanketSalesOrders: TestPage "Blanket Sales Orders";
    begin
        //[SCENARIO #0303] Check lookup value on Blanket Sales Orders with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Blanket Sales Orders
        BlanketSalesOrders.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnBlanketSalesOrders(BlanketSalesOrders);
    end;

    [Test]
    procedure CheckLookupValueOnCustomerTemplateCardWithoutPermissions()
    var
        CustomerTemplateCard: TestPage "Customer Templ. Card";
    begin
        //[SCENARIO #0304] Check lookup value on Customer Template Card without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Customer Template Card
        CustomerTemplateCard.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnCustomerTemplateCard(CustomerTemplateCard);
    end;

    [Test]
    procedure CheckLookupValueOnCustomerTemplateCardWithPermissions()
    var
        CustomerTemplateCard: TestPage "Customer Templ. Card";
    begin
        //[SCENARIO #0305] Check lookup value on Customer Template Card with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Customer Template Card
        CustomerTemplateCard.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnCustomerTemplateCard(CustomerTemplateCard);
    end;

    [Test]
    procedure CheckLookupValueOnCustomerTemplateListWithoutPermissions()
    var
        CustomerTemplateList: TestPage "Customer Templ. List";
    begin
        //[SCENARIO #0306] Check lookup value on Customer Template List without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Customer Template List 
        CustomerTemplateList.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnCustomerTemplateList(CustomerTemplateList);
    end;

    [Test]
    procedure CheckLookupValueOnCustomerTemplateListWithPermissions()
    var
        CustomerTemplateList: TestPage "Customer Templ. List";
    begin
        //[SCENARIO #0307] Check lookup value on Customer Template List with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Customer Template List 
        CustomerTemplateList.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnCustomerTemplateList(CustomerTemplateList);
    end;

    [Test]
    procedure CheckLookupValueOnPostedReturnReceiptWithoutPermissions()
    var
        PostedReturnReceipt: TestPage "Posted Return Receipt";
    begin
        //[SCENARIO #0308] Check lookup value on Posted Return Receipt without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Posted Return Receipt
        PostedReturnReceipt.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnPostedReturnReceipt(PostedReturnReceipt);
    end;

    [Test]
    procedure CheckLookupValueOnPostedReturnReceiptWithPermissions()
    var
        PostedReturnReceipt: TestPage "Posted Return Receipt";
    begin
        //[SCENARIO #0309] Check lookup value on Posted Return Receipt with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Posted Return Receipt
        PostedReturnReceipt.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnPostedReturnReceipt(PostedReturnReceipt);
    end;

    [Test]
    procedure CheckLookupValueOnPostedReturnReceiptsWithoutPermissions()
    var
        PostedReturnReceipts: TestPage "Posted Return Receipts";
    begin
        //[SCENARIO #0310] Check lookup value on Posted Return Receipts without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Posted Return Receipts
        PostedReturnReceipts.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnPostedReturnReceipts(PostedReturnReceipts);
    end;

    [Test]
    procedure CheckLookupValueOnPostedReturnReceiptsWithPermissions()
    var
        PostedReturnReceipts: TestPage "Posted Return Receipts";
    begin
        //[SCENARIO #0311] Check lookup value on Posted Return Receipts with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Posted Return Receipts
        PostedReturnReceipts.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnPostedReturnReceipts(PostedReturnReceipts);
    end;

    [Test]
    procedure CheckLookupValueOnPostedSalesCreditMemoWithoutPermissions()
    var
        PostedSalesCreditMemo: TestPage "Posted Sales Credit Memo";
    begin
        //[SCENARIO #0312] Check lookup value on Posted Sales Credit Memo without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Posted Sales Credit Memo
        PostedSalesCreditMemo.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnPostedSalesCreditMemo(PostedSalesCreditMemo);
    end;

    [Test]
    procedure CheckLookupValueOnPostedSalesCreditMemoWithPermissions()
    var
        PostedSalesCreditMemo: TestPage "Posted Sales Credit Memo";
    begin
        //[SCENARIO #0313] Check lookup value on Posted Sales Credit Memo with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Posted Sales Credit Memo
        PostedSalesCreditMemo.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnPostedSalesCreditMemo(PostedSalesCreditMemo);
    end;

    [Test]
    procedure CheckLookupValueOnPostedSalesCreditMemosWithoutPermissions()
    var
        PostedSalesCreditMemos: TestPage "Posted Sales Credit Memos";
    begin
        //[SCENARIO #0314] Check lookup value on Posted Sales Credit Memos without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Posted Sales Credit Memos
        PostedSalesCreditMemos.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnPostedSalesCreditMemos(PostedSalesCreditMemos);
    end;

    [Test]
    procedure CheckLookupValueOnPostedSalesCreditMemosWithPermissions()
    var
        PostedSalesCreditMemos: TestPage "Posted Sales Credit Memos";
    begin
        //[SCENARIO #0315] Check lookup value on Posted Sales Credit Memos with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Posted Sales Credit Memos
        PostedSalesCreditMemos.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnPostedSalesCreditMemos(PostedSalesCreditMemos);
    end;

    [Test]
    procedure CheckLookupValueOnPostedSalesInvoiceWithoutPermissions()
    var
        PostedSalesInvoice: TestPage "Posted Sales Invoice";
    begin
        //[SCENARIO #0316] Check lookup value on Posted Sales Invoice without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Posted Sales Invoice
        PostedSalesInvoice.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnPostedSalesInvoice(PostedSalesInvoice);
    end;

    [Test]
    procedure CheckLookupValueOnPostedSalesInvoiceWithPermissions()
    var
        PostedSalesInvoice: TestPage "Posted Sales Invoice";
    begin
        //[SCENARIO #0317] Check lookup value on Posted Sales Invoice with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Posted Sales Invoice
        PostedSalesInvoice.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnPostedSalesInvoice(PostedSalesInvoice);
    end;

    [Test]
    procedure CheckLookupValueOnPostedSalesInvoicesWithoutPermissions()
    var
        PostedSalesInvoices: TestPage "Posted Sales Invoices";
    begin
        //[SCENARIO #0318] Check lookup value on Posted Sales Invoices without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Posted Sales Invoices
        PostedSalesInvoices.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnPostedSalesInvoices(PostedSalesInvoices);
    end;

    [Test]
    procedure CheckLookupValueOnPostedSalesInvoicesWithPermissions()
    var
        PostedSalesInvoices: TestPage "Posted Sales Invoices";
    begin
        //[SCENARIO #0319] Check lookup value on Posted Sales Invoices with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Posted Sales Invoices
        PostedSalesInvoices.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnPostedSalesInvoices(PostedSalesInvoices);
    end;

    [Test]
    procedure CheckLookupValueOnPostedSalesShipmentWithoutPermissions()
    var
        PostedSalesShipment: TestPage "Posted Sales Shipment";
    begin
        //[SCENARIO #0320] Check lookup value on Posted Sales Shipment without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Posted Sales Shipment
        PostedSalesShipment.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnPostedSalesShipment(PostedSalesShipment);
    end;

    [Test]
    procedure CheckLookupValueOnPostedSalesShipmentWithPermissions()
    var
        PostedSalesShipment: TestPage "Posted Sales Shipment";
    begin
        //[SCENARIO #0321] Check lookup value on Posted Sales Shipment with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Posted Sales Shipment
        PostedSalesShipment.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnPostedSalesShipment(PostedSalesShipment);
    end;

    [Test]
    procedure CheckLookupValueOnPostedSalesShipmentsWithoutPermissions()
    var
        PostedSalesShipments: TestPage "Posted Sales Shipments";
    begin
        //[SCENARIO #0322] Check lookup value on Posted Sales Shipments without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Posted Sales Shipments
        PostedSalesShipments.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnPostedSalesShipments(PostedSalesShipments);
    end;

    [Test]
    procedure CheckLookupValueOnPostedSalesShipmentsWithPermissions()
    var
        PostedSalesShipments: TestPage "Posted Sales Shipments";
    begin
        //[SCENARIO #0323] Check lookup value on Posted Sales Shipments with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Posted Sales Shipments
        PostedSalesShipments.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnPostedSalesShipments(PostedSalesShipments);
    end;

    [Test]
    procedure CheckLookupValueOnPostedWhseShipmentLinesWithoutPermissions()
    var
        PostedWhseShipmentLines: TestPage "Posted Whse. Shipment Lines";
    begin
        //[SCENARIO #0324] Check lookup value on Posted Whse Shipment Lines without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Posted Whse. Shipment Lines 
        PostedWhseShipmentLines.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnPostedWhseShipmentLines(PostedWhseShipmentLines);
    end;

    [Test]
    procedure CheckLookupValueOnPostedWhseShipmentLinesWithPermissions()
    var
        PostedWhseShipmentLines: TestPage "Posted Whse. Shipment Lines";
    begin
        //[SCENARIO #0325] Check lookup value on Posted Whse Shipment Lines with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Posted Whse. Shipment Lines 
        PostedWhseShipmentLines.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnPostedWhseShipmentLines(PostedWhseShipmentLines);
    end;

    [Test]
    procedure CheckLookupValueOnPstdWhseShipmentSubformWithoutPermissions()
    var
        PstdWhseShipmentSubform: TestPage "Posted Whse. Shipment Subform";
    begin
        //[SCENARIO #0326] Check lookup value on Pstd. Whse Shipment Subform without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Pstd. Whse. Shipment Subform
        PstdWhseShipmentSubform.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnPstdWhseShipmentSubform(PstdWhseShipmentSubform);
    end;

    [Test]
    procedure CheckLookupValueOnPstdWhseShipmentSubformWithPermissions()
    var
        PstdWhseShipmentSubform: TestPage "Posted Whse. Shipment Subform";
    begin
        //[SCENARIO #0327] Check lookup value on Pstd. Whse Shipment Subform with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Pstd. Whse. Shipment Subform
        PstdWhseShipmentSubform.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnPstdWhseShipmentSubform(PstdWhseShipmentSubform);
    end;

    [Test]
    procedure CheckLookupValueOnSalesCreditMemoWithoutPermissions()
    var
        SalesCreditMemo: TestPage "Sales Credit Memo";
    begin
        //[SCENARIO #0328] Check lookup value on Sales Credit Memo without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Sales Credit Memo
        SalesCreditMemo.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnSalesCreditMemo(SalesCreditMemo);
    end;

    [Test]
    procedure CheckLookupValueOnSalesCreditMemoWithPermissions()
    var
        SalesCreditMemo: TestPage "Sales Credit Memo";
    begin
        //[SCENARIO #0329] Check lookup value on Sales Credit Memo with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Sales Credit Memo
        SalesCreditMemo.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnSalesCreditMemo(SalesCreditMemo);
    end;

    [Test]
    procedure CheckLookupValueOnSalesCreditMemosWithoutPermissions()
    var
        SalesCreditMemos: TestPage "Sales Credit Memos";
    begin
        //[SCENARIO #0330] Check lookup value on Sales Credit Memos without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Sales Credit Memos
        SalesCreditMemos.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnSalesCreditMemos(SalesCreditMemos);
    end;

    [Test]
    procedure CheckLookupValueOnSalesCreditMemosWithPermissions()
    var
        SalesCreditMemos: TestPage "Sales Credit Memos";
    begin
        //[SCENARIO #0331] Check lookup value on Sales Credit Memos with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Sales Credit Memos
        SalesCreditMemos.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnSalesCreditMemos(SalesCreditMemos);
    end;

    [Test]
    procedure CheckLookupValueOnSalesInvoiceWithoutPermissions()
    var
        SalesInvoice: TestPage "Sales Invoice";
    begin
        //[SCENARIO #0332] Check lookup value on Sales Invoice without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Sales Invoice
        SalesInvoice.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnSalesInvoice(SalesInvoice);
    end;

    [Test]
    procedure CheckLookupValueOnSalesInvoiceWithPermissions()
    var
        SalesInvoice: TestPage "Sales Invoice";
    begin
        //[SCENARIO #0333] Check lookup value on Sales Invoice with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Sales Invoice
        SalesInvoice.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnSalesInvoice(SalesInvoice);
    end;

    [Test]
    procedure CheckLookupValueOnSalesInvoiceListWithoutPermissions()
    var
        SalesInvoiceList: TestPage "Sales Invoice List";
    begin
        //[SCENARIO #0334] Check lookup value on Sales Invoice List without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Sales Invoice List 
        SalesInvoiceList.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnSalesInvoiceList(SalesInvoiceList);
    end;

    [Test]
    procedure CheckLookupValueOnSalesInvoiceListWithPermissions()
    var
        SalesInvoiceList: TestPage "Sales Invoice List";
    begin
        //[SCENARIO #0335] Check lookup value on Sales Invoice List with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Sales Invoice List 
        SalesInvoiceList.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnSalesInvoiceList(SalesInvoiceList);
    end;

    [Test]
    procedure CheckLookupValueOnSalesListWithoutPermissions()
    var
        SalesList: TestPage "Sales List";
    begin
        //[SCENARIO #0336] Check lookup value on Sales List without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Sales List 
        SalesList.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnSalesList(SalesList);
    end;

    [Test]
    procedure CheckLookupValueOnSalesListWithPermissions()
    var
        SalesList: TestPage "Sales List";
    begin
        //[SCENARIO #0337] Check lookup value on Sales List with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Sales List 
        SalesList.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnSalesList(SalesList);
    end;

    [Test]
    procedure CheckLookupValueOnSalesListArchiveWithoutPermissions()
    var
        SalesListArchive: TestPage "Sales List Archive";
    begin
        //[SCENARIO #0338] Check lookup value on Sales List Archive without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Sales List Archive
        SalesListArchive.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnSalesListArchive(SalesListArchive);
    end;

    [Test]
    procedure CheckLookupValueOnSalesListArchiveWithPermissions()
    var
        SalesListArchive: TestPage "Sales List Archive";
    begin
        //[SCENARIO #0339] Check lookup value on Sales List Archive with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Sales List Archive
        SalesListArchive.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnSalesListArchive(SalesListArchive);
    end;

    [Test]
    procedure CheckLookupValueOnSalesOrderWithoutPermissions()
    var
        SalesOrder: TestPage "Sales Order";
    begin
        //[SCENARIO #0340] Check lookup value on Sales Order without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Sales Order 
        SalesOrder.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnSalesOrder(SalesOrder);
    end;

    [Test]
    procedure CheckLookupValueOnSalesOrderWithPermissions()
    var
        SalesOrder: TestPage "Sales Order";
    begin
        //[SCENARIO #0341] Check lookup value on Sales Order with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Sales Order 
        SalesOrder.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnSalesOrder(SalesOrder);
    end;

    [Test]
    procedure CheckLookupValueOnSalesOrderListWithoutPermissions()
    var
        SalesOrderList: TestPage "Sales Order List";
    begin
        //[SCENARIO #0342] Check lookup value on Sales Order List  without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Sales Order List  
        SalesOrderList.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnSalesOrderList(SalesOrderList);
    end;

    [Test]
    procedure CheckLookupValueOnSalesOrderListWithPermissions()
    var
        SalesOrderList: TestPage "Sales Order List";
    begin
        //[SCENARIO #0343] Check lookup value on Sales Order List  with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Sales Order List  
        SalesOrderList.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnSalesOrderList(SalesOrderList);
    end;

    [Test]
    procedure CheckLookupValueOnSalesOrderArchiveWithoutPermissions()
    var
        SalesOrderArchive: TestPage "Sales Order Archive";
    begin
        //[SCENARIO #0344] Check lookup value on Sales Order Archive without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Sales Order Archive
        SalesOrderArchive.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnSalesOrderArchive(SalesOrderArchive);
    end;

    [Test]
    procedure CheckLookupValueOnSalesOrderArchiveWithPermissions()
    var
        SalesOrderArchive: TestPage "Sales Order Archive";
    begin
        //[SCENARIO #0345] Check lookup value on Sales Order Archive with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Sales Order Archive
        SalesOrderArchive.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnSalesOrderArchive(SalesOrderArchive);
    end;

    [Test]
    procedure CheckLookupValueOnSalesOrderArchivesWithoutPermissions()
    var
        SalesOrderArchives: TestPage "Sales Order Archives";
    begin
        //[SCENARIO #0346] Check lookup value on Sales Order Archives without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Sales Order Archives
        SalesOrderArchives.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnSalesOrderArchives(SalesOrderArchives);
    end;

    [Test]
    procedure CheckLookupValueOnSalesOrderArchivesWithPermissions()
    var
        SalesOrderArchives: TestPage "Sales Order Archives";
    begin
        //[SCENARIO #0347] Check lookup value on Sales Order Archives with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Sales Order Archives
        SalesOrderArchives.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnSalesOrderArchives(SalesOrderArchives);
    end;

    [Test]
    procedure CheckLookupValueOnSalesQuoteWithoutPermissions()
    var
        SalesQuote: TestPage "Sales Quote";
    begin
        //[SCENARIO #0348] Check lookup value on Sales Quote without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Sales Quote 
        SalesQuote.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnSalesQuote(SalesQuote);
    end;

    [Test]
    procedure CheckLookupValueOnSalesQuoteWithPermissions()
    var
        SalesQuote: TestPage "Sales Quote";
    begin
        //[SCENARIO #0349] Check lookup value on Sales Quote with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Sales Quote 
        SalesQuote.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnSalesQuote(SalesQuote);
    end;

    [Test]
    procedure CheckLookupValueOnSalesQuotesWithoutPermissions()
    var
        SalesQuotes: TestPage "Sales Quotes";
    begin
        //[SCENARIO #0350] Check lookup value on Sales Quotes without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Sales Quotes
        SalesQuotes.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnSalesQuotes(SalesQuotes);
    end;

    [Test]
    procedure CheckLookupValueOnSalesQuotesWithPermissions()
    var
        SalesQuotes: TestPage "Sales Quotes";
    begin
        //[SCENARIO #0351] Check lookup value on Sales Quotes with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Sales Quotes
        SalesQuotes.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnSalesQuotes(SalesQuotes);
    end;

    [Test]
    procedure CheckLookupValueOnSalesQuoteArchiveWithoutPermissions()
    var
        SalesQuoteArchive: TestPage "Sales Quote Archive";
    begin
        //[SCENARIO #0352] Check lookup value on Sales Quote Archive without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Sales Quote Archive
        SalesQuoteArchive.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnSalesQuoteArchive(SalesQuoteArchive);
    end;

    [Test]
    procedure CheckLookupValueOnSalesQuoteArchiveWithPermissions()
    var
        SalesQuoteArchive: TestPage "Sales Quote Archive";
    begin
        //[SCENARIO #0353] Check lookup value on Sales Quote Archive with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Sales Quote Archive
        SalesQuoteArchive.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnSalesQuoteArchive(SalesQuoteArchive);
    end;

    [Test]
    procedure CheckLookupValueOnSalesQuoteArchivesWithoutPermissions()
    var
        SalesQuoteArchives: TestPage "Sales Quote Archives";
    begin
        //[SCENARIO #0354] Check lookup value on Sales Quote Archives without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Sales Quote Archives
        SalesQuoteArchives.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnSalesQuoteArchives(SalesQuoteArchives);
    end;

    [Test]
    procedure CheckLookupValueOnSalesQuoteArchivesWithPermissions()
    var
        SalesQuoteArchives: TestPage "Sales Quote Archives";
    begin
        //[SCENARIO #0355] Check lookup value on Sales Quote Archives with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Sales Quote Archives
        SalesQuoteArchives.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnSalesQuoteArchives(SalesQuoteArchives);
    end;

    [Test]
    procedure CheckLookupValueOnSalesReturnOrderWithoutPermissions()
    var
        SalesReturnOrder: TestPage "Sales Return Order";
    begin
        //[SCENARIO #0356] Check lookup value on Sales Return Order without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Sales Return Order 
        SalesReturnOrder.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnSalesReturnOrder(SalesReturnOrder);
    end;

    [Test]
    procedure CheckLookupValueOnSalesReturnOrderWithPermissions()
    var
        SalesReturnOrder: TestPage "Sales Return Order";
    begin
        //[SCENARIO #0357] Check lookup value on Sales Return Order with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Sales Return Order 
        SalesReturnOrder.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnSalesReturnOrder(SalesReturnOrder);
    end;

    [Test]
    procedure CheckLookupValueOnSalesReturnOrderListWithoutPermissions()
    var
        SalesReturnOrderList: TestPage "Sales Return Order List";
    begin
        //[SCENARIO #0358] Check lookup value on Sales Return Order List  without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Sales Return Order List  
        SalesReturnOrderList.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnSalesReturnOrderList(SalesReturnOrderList);
    end;

    [Test]
    procedure CheckLookupValueOnSalesReturnOrderListWithPermissions()
    var
        SalesReturnOrderList: TestPage "Sales Return Order List";
    begin
        //[SCENARIO #0359] Check lookup value on Sales Return Order List  with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Sales Return Order List  
        SalesReturnOrderList.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnSalesReturnOrderList(SalesReturnOrderList);
    end;

    [Test]
    procedure CheckLookupValueOnSalesReturnOrderArchiveWithoutPermissions()
    var
        SalesReturnOrderArchive: TestPage "Sales Return Order Archive";
    begin
        //[SCENARIO #0360] Check lookup value on Sales Return Order Archive without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Sales Return Order Archive
        SalesReturnOrderArchive.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnSalesReturnOrderArchive(SalesReturnOrderArchive);
    end;

    [Test]
    procedure CheckLookupValueOnSalesReturnOrderArchiveWithPermissions()
    var
        SalesReturnOrderArchive: TestPage "Sales Return Order Archive";
    begin
        //[SCENARIO #0361] Check lookup value on Sales Return Order Archive with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Sales Return Order Archive
        SalesReturnOrderArchive.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnSalesReturnOrderArchive(SalesReturnOrderArchive);
    end;

    [Test]
    procedure CheckLookupValueOnSalesRtrnOrderListArchWithoutPermissions()
    var
        SalesReturnListArchive: TestPage "Sales Return List Archive";
    begin
        //[SCENARIO #0362] Check lookup value on Sales Rtrn Order List Arch without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Sales Return List Archive
        SalesReturnListArchive.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnSalesReturnListArchive(SalesReturnListArchive);
    end;

    [Test]
    procedure CheckLookupValueOnSalesRtrnOrderListArchWithPermissions()
    var
        SalesReturnListArchive: TestPage "Sales Return List Archive";
    begin
        //[SCENARIO #0363] Check lookup value on Sales Rtrn Order List Arch with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Sales Return List Archive
        SalesReturnListArchive.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnSalesReturnListArchive(SalesReturnListArchive);
    end;

    [Test]
    procedure CheckLookupValueOnWhseShipmentLinesWithoutPermissions()
    var
        WhseShipmentLines: TestPage "Whse. Shipment Lines";
    begin
        //[SCENARIO #0364] Check lookup value on Whse Shipment Lines without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Whse. Shipment Lines 
        WhseShipmentLines.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnWhseShipmentLines(WhseShipmentLines);
    end;

    [Test]
    procedure CheckLookupValueOnWhseShipmentLinesWithPermissions()
    var
        WhseShipmentLines: TestPage "Whse. Shipment Lines";
    begin
        //[SCENARIO #0365] Check lookup value on Whse Shipment Lines with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Whse. Shipment Lines 
        WhseShipmentLines.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnWhseShipmentLines(WhseShipmentLines);
    end;

    [Test]
    procedure CheckLookupValueOnWhseShipmentSubformWithoutPermissions()
    var
        WhseShipmentSubform: TestPage "Whse. Shipment Subform";
    begin
        //[SCENARIO #0366] Check lookup value on Whse Shipment Subform without permissions

        //[GIVEN] Full base starting permissions
        SetFullBaseStartingPermissions();

        //[WHEN] Open Whse. Shipment Subform
        WhseShipmentSubform.OpenView();

        //[THEN] Lookup value field not shown
        VerifyLookupValueNotShownOnWhseShipmentSubform(WhseShipmentSubform);
    end;

    [Test]
    procedure CheckLookupValueOnWhseShipmentSubformWithPermissions()
    var
        WhseShipmentSubform: TestPage "Whse. Shipment Subform";
    begin
        //[SCENARIO #0367] Check lookup value on Whse Shipment Subform with permissions

        //[GIVEN] Full base starting permissions extended with Lookup Value permissions
        SetFullBaseStartingPermissionsExtendedWithLookupValue();

        //[WHEN] Open Whse. Shipment Subform
        WhseShipmentSubform.OpenView();

        //[THEN] Lookup value field shown
        VerifyLookupValueShownOnWhseShipmentSubform(WhseShipmentSubform);
    end;

    local procedure SetFullBaseStartingPermissions()
    begin
        LibraryLowerPermissions.StartLoggingNAVPermissions('D365 BUS FULL ACCESS');
    end;

    local procedure SetFullBaseStartingPermissionsExtendedWithLookupValue()
    begin
        SetFullBaseStartingPermissions();
        AddLookupValuePermissions();
    end;

    local procedure SetFullBasePermissions()
    begin
        LibraryLowerPermissions.SetO365BusFull();
    end;

    local procedure SetFullBasePermissionsExtendedWithLookupValue()
    begin
        SetFullBasePermissions();
        AddLookupValuePermissions();
    end;

    local procedure SetUnrestrictedStartingPermissions()
    begin
        LibraryLowerPermissions.StartLoggingNAVPermissions('SUPER');
    end;

    local procedure AddLookupValuePermissions()
    begin
        LibraryLowerPermissions.AddPermissionSet('LOOKUP VALUE');
    end;

    local procedure VerifyLookupValueNotShownOnBlanketSalesOrder(var BlanketSalesOrder: TestPage "Blanket Sales Order")
    begin
        asserterror Assert.IsFalse(BlanketSalesOrder."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        BlanketSalesOrder.Close();
    end;

    local procedure VerifyLookupValueShownOnBlanketSalesOrder(var BlanketSalesOrder: TestPage "Blanket Sales Order")
    begin
        Assert.IsTrue(BlanketSalesOrder."Lookup Value Code".Visible(), 'Not visible');
        BlanketSalesOrder.Close();
    end;

    local procedure VerifyLookupValueNotShownOnBlanketSalesOrders(var BlanketSalesOrders: TestPage "Blanket Sales Orders")
    begin
        asserterror Assert.IsFalse(BlanketSalesOrders."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        BlanketSalesOrders.Close();
    end;

    local procedure VerifyLookupValueShownOnBlanketSalesOrders(var BlanketSalesOrders: TestPage "Blanket Sales Orders")
    begin
        Assert.IsTrue(BlanketSalesOrders."Lookup Value Code".Visible(), 'Not visible');
        BlanketSalesOrders.Close();
    end;

    local procedure VerifyLookupValueNotShownOnCustomerTemplateCard(CustomerTemplateCard: TestPage "Customer Templ. Card")
    begin
        asserterror Assert.IsFalse(CustomerTemplateCard."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        CustomerTemplateCard.Close();
    end;

    local procedure VerifyLookupValueShownOnCustomerTemplateCard(CustomerTemplateCard: TestPage "Customer Templ. Card")
    begin
        Assert.IsTrue(CustomerTemplateCard."Lookup Value Code".Visible(), 'Not visible');
        CustomerTemplateCard.Close();
    end;

    local procedure VerifyLookupValueNotShownOnCustomerTemplateList(CustomerTemplateList: TestPage "Customer Templ. List")
    begin
        asserterror Assert.IsFalse(CustomerTemplateList."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        CustomerTemplateList.Close();
    end;

    local procedure VerifyLookupValueShownOnCustomerTemplateList(var CustomerTemplateList: TestPage "Customer Templ. List")
    begin
        Assert.IsTrue(CustomerTemplateList."Lookup Value Code".Visible(), 'Not visible');
        CustomerTemplateList.Close();
    end;

    local procedure VerifyLookupValueNotShownOnPostedReturnReceipt(var PostedReturnReceipt: TestPage "Posted Return Receipt")
    begin
        asserterror Assert.IsFalse(PostedReturnReceipt."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        PostedReturnReceipt.Close();
    end;

    local procedure VerifyLookupValueShownOnPostedReturnReceipt(var PostedReturnReceipt: TestPage "Posted Return Receipt")
    begin
        Assert.IsTrue(PostedReturnReceipt."Lookup Value Code".Visible(), 'Not visible');
        PostedReturnReceipt.Close();
    end;

    local procedure VerifyLookupValueNotShownOnPostedReturnReceipts(var PostedReturnReceipts: TestPage "Posted Return Receipts")
    begin
        asserterror Assert.IsFalse(PostedReturnReceipts."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        PostedReturnReceipts.Close();
    end;

    local procedure VerifyLookupValueShownOnPostedReturnReceipts(var PostedReturnReceipts: TestPage "Posted Return Receipts")
    begin
        Assert.IsTrue(PostedReturnReceipts."Lookup Value Code".Visible(), 'Not visible');
        PostedReturnReceipts.Close();
    end;

    local procedure VerifyLookupValueNotShownOnPostedSalesCreditMemo(var PostedSalesCreditMemo: TestPage "Posted Sales Credit Memo")
    begin
        asserterror Assert.IsFalse(PostedSalesCreditMemo."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        PostedSalesCreditMemo.Close();
    end;

    local procedure VerifyLookupValueShownOnPostedSalesCreditMemo(var PostedSalesCreditMemo: TestPage "Posted Sales Credit Memo")
    begin
        Assert.IsTrue(PostedSalesCreditMemo."Lookup Value Code".Visible(), 'Not visible');
        PostedSalesCreditMemo.Close();
    end;

    local procedure VerifyLookupValueNotShownOnPostedSalesCreditMemos(var PostedSalesCreditMemos: TestPage "Posted Sales Credit Memos")
    begin
        asserterror Assert.IsFalse(PostedSalesCreditMemos."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        PostedSalesCreditMemos.Close();
    end;

    local procedure VerifyLookupValueShownOnPostedSalesCreditMemos(var PostedSalesCreditMemos: TestPage "Posted Sales Credit Memos")
    begin
        Assert.IsTrue(PostedSalesCreditMemos."Lookup Value Code".Visible(), 'Not visible');
        PostedSalesCreditMemos.Close();
    end;

    local procedure VerifyLookupValueNotShownOnPostedSalesInvoice(var PostedSalesInvoice: TestPage "Posted Sales Invoice")
    begin
        asserterror Assert.IsFalse(PostedSalesInvoice."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        PostedSalesInvoice.Close();
    end;

    local procedure VerifyLookupValueShownOnPostedSalesInvoice(var PostedSalesInvoice: TestPage "Posted Sales Invoice")
    begin
        Assert.IsTrue(PostedSalesInvoice."Lookup Value Code".Visible(), 'Not visible');
        PostedSalesInvoice.Close();
    end;

    local procedure VerifyLookupValueNotShownOnPostedSalesInvoices(var PostedSalesInvoices: TestPage "Posted Sales Invoices")
    begin
        asserterror Assert.IsFalse(PostedSalesInvoices."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        PostedSalesInvoices.Close();
    end;

    local procedure VerifyLookupValueShownOnPostedSalesInvoices(var PostedSalesInvoices: TestPage "Posted Sales Invoices")
    begin
        Assert.IsTrue(PostedSalesInvoices."Lookup Value Code".Visible(), 'Not visible');
        PostedSalesInvoices.Close();
    end;

    local procedure VerifyLookupValueNotShownOnPostedSalesShipment(var PostedSalesShipment: TestPage "Posted Sales Shipment")
    begin
        asserterror Assert.IsFalse(PostedSalesShipment."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        PostedSalesShipment.Close();
    end;

    local procedure VerifyLookupValueShownOnPostedSalesShipment(var PostedSalesShipment: TestPage "Posted Sales Shipment")
    begin
        Assert.IsTrue(PostedSalesShipment."Lookup Value Code".Visible(), 'Not visible');
        PostedSalesShipment.Close();
    end;

    local procedure VerifyLookupValueNotShownOnPostedSalesShipments(var PostedSalesShipments: TestPage "Posted Sales Shipments")
    begin
        asserterror Assert.IsFalse(PostedSalesShipments."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        PostedSalesShipments.Close();
    end;

    local procedure VerifyLookupValueShownOnPostedSalesShipments(var PostedSalesShipments: TestPage "Posted Sales Shipments")
    begin
        Assert.IsTrue(PostedSalesShipments."Lookup Value Code".Visible(), 'Not visible');
        PostedSalesShipments.Close();
    end;

    local procedure VerifyLookupValueNotShownOnPostedWhseShipmentLines(var PostedWhseShipmentLines: TestPage "Posted Whse. Shipment Lines")
    begin
        asserterror Assert.IsFalse(PostedWhseShipmentLines."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        PostedWhseShipmentLines.Close();
    end;

    local procedure VerifyLookupValueShownOnPostedWhseShipmentLines(var PostedWhseShipmentLines: TestPage "Posted Whse. Shipment Lines")
    begin
        Assert.IsTrue(PostedWhseShipmentLines."Lookup Value Code".Visible(), 'Not visible');
        PostedWhseShipmentLines.Close();
    end;

    local procedure VerifyLookupValueNotShownOnPstdWhseShipmentSubform(var PstdWhseShipmentSubform: TestPage "Posted Whse. Shipment Subform")
    begin
        asserterror Assert.IsFalse(PstdWhseShipmentSubform."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        PstdWhseShipmentSubform.Close();
    end;

    local procedure VerifyLookupValueShownOnPstdWhseShipmentSubform(var PstdWhseShipmentSubform: TestPage "Posted Whse. Shipment Subform")
    begin
        Assert.IsTrue(PstdWhseShipmentSubform."Lookup Value Code".Visible(), 'Not visible');
        PstdWhseShipmentSubform.Close();
    end;

    local procedure VerifyLookupValueNotShownOnSalesCreditMemo(var SalesCreditMemo: TestPage "Sales Credit Memo")
    begin
        asserterror Assert.IsFalse(SalesCreditMemo."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        SalesCreditMemo.Close();
    end;

    local procedure VerifyLookupValueShownOnSalesCreditMemo(var SalesCreditMemo: TestPage "Sales Credit Memo")
    begin
        Assert.IsTrue(SalesCreditMemo."Lookup Value Code".Visible(), 'Not visible');
        SalesCreditMemo.Close();
    end;

    local procedure VerifyLookupValueNotShownOnSalesCreditMemos(var SalesCreditMemos: TestPage "Sales Credit Memos")
    begin
        asserterror Assert.IsFalse(SalesCreditMemos."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        SalesCreditMemos.Close();
    end;

    local procedure VerifyLookupValueShownOnSalesCreditMemos(var SalesCreditMemos: TestPage "Sales Credit Memos")
    begin
        Assert.IsTrue(SalesCreditMemos."Lookup Value Code".Visible(), 'Not visible');
        SalesCreditMemos.Close();
    end;

    local procedure VerifyLookupValueNotShownOnSalesInvoice(var SalesInvoice: TestPage "Sales Invoice")
    begin
        asserterror Assert.IsFalse(SalesInvoice."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        SalesInvoice.Close();
    end;

    local procedure VerifyLookupValueShownOnSalesInvoice(var SalesInvoice: TestPage "Sales Invoice")
    begin
        Assert.IsTrue(SalesInvoice."Lookup Value Code".Visible(), 'Not visible');
        SalesInvoice.Close();
    end;

    local procedure VerifyLookupValueNotShownOnSalesInvoiceList(var SalesInvoiceList: TestPage "Sales Invoice List")
    begin
        asserterror Assert.IsFalse(SalesInvoiceList."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        SalesInvoiceList.Close();
    end;

    local procedure VerifyLookupValueShownOnSalesInvoiceList(var SalesInvoiceList: TestPage "Sales Invoice List")
    begin
        Assert.IsTrue(SalesInvoiceList."Lookup Value Code".Visible(), 'Not visible');
        SalesInvoiceList.Close();
    end;

    local procedure VerifyLookupValueNotShownOnSalesList(var SalesList: TestPage "Sales List")
    begin
        asserterror Assert.IsFalse(SalesList."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        SalesList.Close();
    end;

    local procedure VerifyLookupValueShownOnSalesList(var SalesList: TestPage "Sales List")
    begin
        Assert.IsTrue(SalesList."Lookup Value Code".Visible(), 'Not visible');
        SalesList.Close();
    end;

    local procedure VerifyLookupValueNotShownOnSalesListArchive(var SalesListArchive: TestPage "Sales List Archive")
    begin
        asserterror Assert.IsFalse(SalesListArchive."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        SalesListArchive.Close();
    end;

    local procedure VerifyLookupValueShownOnSalesListArchive(var SalesListArchive: TestPage "Sales List Archive")
    begin
        Assert.IsTrue(SalesListArchive."Lookup Value Code".Visible(), 'Not visible');
        SalesListArchive.Close();
    end;

    local procedure VerifyLookupValueNotShownOnSalesOrder(var SalesOrder: TestPage "Sales Order")
    begin
        asserterror Assert.IsFalse(SalesOrder."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        SalesOrder.Close();
    end;

    local procedure VerifyLookupValueShownOnSalesOrder(var SalesOrder: TestPage "Sales Order")
    begin
        Assert.IsTrue(SalesOrder."Lookup Value Code".Visible(), 'Not visible');
        SalesOrder.Close();
    end;

    local procedure VerifyLookupValueNotShownOnSalesOrderList(var SalesOrderList: TestPage "Sales Order List")
    begin
        asserterror Assert.IsFalse(SalesOrderList."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        SalesOrderList.Close();
    end;

    local procedure VerifyLookupValueShownOnSalesOrderList(var SalesOrderList: TestPage "Sales Order List")
    begin
        Assert.IsTrue(SalesOrderList."Lookup Value Code".Visible(), 'Not visible');
        SalesOrderList.Close();
    end;

    local procedure VerifyLookupValueNotShownOnSalesOrderArchive(var SalesOrderArchive: TestPage "Sales Order Archive")
    begin
        asserterror Assert.IsFalse(SalesOrderArchive."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        SalesOrderArchive.Close();
    end;

    local procedure VerifyLookupValueShownOnSalesOrderArchive(var SalesOrderArchive: TestPage "Sales Order Archive")
    begin
        Assert.IsTrue(SalesOrderArchive."Lookup Value Code".Visible(), 'Not visible');
        SalesOrderArchive.Close();
    end;

    local procedure VerifyLookupValueNotShownOnSalesOrderArchives(var SalesOrderArchives: TestPage "Sales Order Archives")
    begin
        asserterror Assert.IsFalse(SalesOrderArchives."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        SalesOrderArchives.Close();
    end;

    local procedure VerifyLookupValueShownOnSalesOrderArchives(var SalesOrderArchives: TestPage "Sales Order Archives")
    begin
        Assert.IsTrue(SalesOrderArchives."Lookup Value Code".Visible(), 'Not visible');
        SalesOrderArchives.Close();
    end;

    local procedure VerifyLookupValueNotShownOnSalesQuote(var SalesQuote: TestPage "Sales Quote")
    begin
        asserterror Assert.IsFalse(SalesQuote."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        SalesQuote.Close();
    end;

    local procedure VerifyLookupValueShownOnSalesQuote(var SalesQuote: TestPage "Sales Quote")
    begin
        Assert.IsTrue(SalesQuote."Lookup Value Code".Visible(), 'Not visible');
        SalesQuote.Close();
    end;

    local procedure VerifyLookupValueNotShownOnSalesQuotes(var SalesQuotes: TestPage "Sales Quotes")
    begin
        asserterror Assert.IsFalse(SalesQuotes."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        SalesQuotes.Close();
    end;

    local procedure VerifyLookupValueShownOnSalesQuotes(var SalesQuotes: TestPage "Sales Quotes")
    begin
        Assert.IsTrue(SalesQuotes."Lookup Value Code".Visible(), 'Not visible');
        SalesQuotes.Close();
    end;

    local procedure VerifyLookupValueNotShownOnSalesQuoteArchive(var SalesQuoteArchive: TestPage "Sales Quote Archive")
    begin
        asserterror Assert.IsFalse(SalesQuoteArchive."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        SalesQuoteArchive.Close();
    end;

    local procedure VerifyLookupValueShownOnSalesQuoteArchive(var SalesQuoteArchive: TestPage "Sales Quote Archive")
    begin
        Assert.IsTrue(SalesQuoteArchive."Lookup Value Code".Visible(), 'Not visible');
        SalesQuoteArchive.Close();
    end;

    local procedure VerifyLookupValueNotShownOnSalesQuoteArchives(var SalesQuoteArchives: TestPage "Sales Quote Archives")
    begin
        asserterror Assert.IsFalse(SalesQuoteArchives."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        SalesQuoteArchives.Close();
    end;

    local procedure VerifyLookupValueShownOnSalesQuoteArchives(var SalesQuoteArchives: TestPage "Sales Quote Archives")
    begin
        Assert.IsTrue(SalesQuoteArchives."Lookup Value Code".Visible(), 'Not visible');
        SalesQuoteArchives.Close();
    end;

    local procedure VerifyLookupValueNotShownOnSalesReturnOrder(var SalesReturnOrder: TestPage "Sales Return Order")
    begin
        asserterror Assert.IsFalse(SalesReturnOrder."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        SalesReturnOrder.Close();
    end;

    local procedure VerifyLookupValueShownOnSalesReturnOrder(var SalesReturnOrder: TestPage "Sales Return Order")
    begin
        Assert.IsTrue(SalesReturnOrder."Lookup Value Code".Visible(), 'Not visible');
        SalesReturnOrder.Close();
    end;

    local procedure VerifyLookupValueNotShownOnSalesReturnOrderList(var SalesReturnOrderList: TestPage "Sales Return Order List")
    begin
        asserterror Assert.IsFalse(SalesReturnOrderList."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        SalesReturnOrderList.Close();
    end;

    local procedure VerifyLookupValueShownOnSalesReturnOrderList(var SalesReturnOrderList: TestPage "Sales Return Order List")
    begin
        Assert.IsTrue(SalesReturnOrderList."Lookup Value Code".Visible(), 'Not visible');
        SalesReturnOrderList.Close();
    end;

    local procedure VerifyLookupValueNotShownOnSalesReturnOrderArchive(var SalesReturnOrderArchive: TestPage "Sales Return Order Archive")
    begin
        asserterror Assert.IsFalse(SalesReturnOrderArchive."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        SalesReturnOrderArchive.Close();
    end;

    local procedure VerifyLookupValueShownOnSalesReturnOrderArchive(var SalesReturnOrderArchive: TestPage "Sales Return Order Archive")
    begin
        Assert.IsTrue(SalesReturnOrderArchive."Lookup Value Code".Visible(), 'Not visible');
        SalesReturnOrderArchive.Close();
    end;

    local procedure VerifyLookupValueNotShownOnSalesReturnListArchive(var SalesReturnListArchive: TestPage "Sales Return List Archive")
    begin
        asserterror Assert.IsFalse(SalesReturnListArchive."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        SalesReturnListArchive.Close();
    end;

    local procedure VerifyLookupValueShownOnSalesReturnListArchive(var SalesReturnListArchive: TestPage "Sales Return List Archive")
    begin
        Assert.IsTrue(SalesReturnListArchive."Lookup Value Code".Visible(), 'Not visible');
        SalesReturnListArchive.Close();
    end;

    local procedure VerifyLookupValueNotShownOnWhseShipmentLines(var WhseShipmentLines: TestPage "Whse. Shipment Lines")
    begin
        asserterror Assert.IsFalse(WhseShipmentLines."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        WhseShipmentLines.Close();
    end;

    local procedure VerifyLookupValueShownOnWhseShipmentLines(var WhseShipmentLines: TestPage "Whse. Shipment Lines")
    begin
        Assert.IsTrue(WhseShipmentLines."Lookup Value Code".Visible(), 'Not visible');
        WhseShipmentLines.Close();
    end;

    local procedure VerifyLookupValueNotShownOnWhseShipmentSubform(var WhseShipmentSubform: TestPage "Whse. Shipment Subform")
    begin
        asserterror Assert.IsFalse(WhseShipmentSubform."Lookup Value Code".Visible(), 'Visible');
        Assert.ExpectedError(NotFoundOnPage);
        WhseShipmentSubform.Close();
    end;

    local procedure VerifyLookupValueShownOnWhseShipmentSubform(var WhseShipmentSubform: TestPage "Whse. Shipment Subform")
    begin
        Assert.IsTrue(WhseShipmentSubform."Lookup Value Code".Visible(), 'Not visible');
        WhseShipmentSubform.Close();
    end;
}