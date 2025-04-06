# Journal Lines API GTK Custom

## Overview
This custom API provides a RESTful interface for managing general journal lines in Business Central. It's designed to handle financial journal entries with comprehensive field support and automated line number management.

## API Specifications
- **APIGroup**: `GTKAPI`
- **APIPublisher**: `GTKIPL`
- **APIVersion**: `v2.0`
- **EntityName**: `journalLine`
- **EntitySetName**: `journalLines`
- **ODataKeyFields**: `SystemId`

## Endpoints

### Base URL Structure
```
https://{baseURL}/api/GTKIPL/GTKAPI/v2.0/journalLines
```

### Available Operations

#### Get Journal Lines
```http
GET /api/GTKIPL/GTKAPI/v2.0/journalLines
```

#### Get Journal Lines by Template and Batch
```http
GET /api/GTKIPL/GTKAPI/v2.0/journalLines?$filter=journalTemplateName eq '{templateName}' and journalBatchName eq '{batchName}'
```

#### Get Specific Journal Line
```http
GET /api/GTKIPL/GTKAPI/v2.0/journalLines({systemId})
```

#### Create Journal Line
```http
POST /api/GTKIPL/GTKAPI/v2.0/journalLines
Content-Type: application/json

{
    "journalBatchId": "YOUR-BATCH-ID",
    "journalTemplateName": "GENERAL",
    "accountType": "G/L Account",
    "accountNo": "10400",
    "postingDate": "2025-04-06",
    "documentNo": "INV001",
    "amount": 1000.00,
    "description": "Office Supplies"
}
```

## Field Reference

### Key Fields
- `systemId`: System ID (Key field)
- `journalBatchId`: Journal Batch ID
- `journalBatchName`: Journal Batch Name
- `journalTemplateName`: Journal Template Name
- `lineNo`: Line Number (Auto-generated)

### Document Fields
- `postingDate`: Posting Date
- `documentType`: Document Type
- `documentNo`: Document Number
- `documentDate`: Document Date
- `dueDate`: Due Date
- `externalDocumentNo`: External Document Number
- `yourReference`: Your Reference

### Account Fields
- `accountType`: Account Type
- `accountNo`: Account Number
- `accountId`: Account ID
- `balAccountNo`: Balancing Account Number
- `balAccountType`: Balancing Account Type
- `balanceAccountId`: Balance Account ID

### Amount Fields
- `amount`: Amount
- `amountLCY`: Amount (LCY)
- `currencyCode`: Currency Code
- `currencyFactor`: Currency Factor

### Posting Group Fields
- `genBusPostingGroup`: General Business Posting Group
- `genPostingType`: General Posting Type
- `genProdPostingGroup`: General Product Posting Group
- `balGenBusPostingGroup`: Bal. General Business Posting Group
- `balGenPostingType`: Bal. General Posting Type
- `balGenProdPostingGroup`: Bal. General Product Posting Group
- `balVATBusPostingGroup`: Bal. VAT Business Posting Group
- `balVATProdPostingGroup`: Bal. VAT Product Posting Group

### Additional Fields
- `shortcutDimension1Code`: Dimension 1 Code
- `shortcutDimension2Code`: Dimension 2 Code
- `description`: Description
- `comment`: Comment
- `paymentMethodCode`: Payment Method Code
- `paymentTermsCode`: Payment Terms Code

## Technical Details

### Line Number Generation
- Starting line number: 10000
- Increment: 100
- Automatically assigns next available line number
- Handles gaps for future insertions

### Features
- Delayed Insert enabled for performance
- Automatic line number generation
- Full support for dimensions
- Comprehensive posting group handling
- Multi-currency support

## Best Practices
1. Always provide required fields
2. Use proper account types and numbers
3. Include appropriate posting dates
4. Validate currency codes when used
5. Set proper dimension codes as configured
6. Handle errors appropriately

## Notes
- The API uses OData v4.0 query syntax
- All requests require proper authentication
- Special characters in filter values must be URL encoded
- Response format is JSON
- Dates should be in ISO 8601 format
