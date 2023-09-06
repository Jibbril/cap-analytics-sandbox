using CatalogService as service from '../../srv/cat-service';

annotate service.Books with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'title',
            Value : title,
            ![@UI.Importance] : #High,
            ![@HTML5.CssDefaults]: { width: '12rem' }
        },
        {
            $Type : 'UI.DataField',
            Label : 'stock',
            Value : stock,
            ![@UI.Importance] : #High,
            ![@HTML5.CssDefaults]: { width: '5rem' }
        },
        {
            $Type : 'UI.DataField',
            Label : 'price',
            Value : price,
            ![@UI.Importance] : #High,
            ![@HTML5.CssDefaults]: { width: '5rem' }
        },
        {
            $Type : 'UI.DataField',
            Label : 'currency',
            Value : currency,
            ![@UI.Importance] : #High,
            ![@HTML5.CssDefaults]: { width: '5rem' }
        },
        {
            $Type : 'UI.DataField',
            Label : 'Converted Price',
            Value : calculations.CONVERTED_PRICE,
            ![@UI.Importance] : #High,
            ![@HTML5.CssDefaults]: { width: '8rem' }
        },
        {
            $Type : 'UI.DataField',
            Label : 'Converted Currency',
            Value : calculations.CONVERTED_PRICE_CURRENCY,
            ![@UI.Importance] : #High,
            ![@HTML5.CssDefaults]: { width: '10rem' }
        },
        {
            $Type : 'UI.DataField',
            Label : 'Combination',
            Value : calculations.CONVERTED_PRICE_AND_CURRENCY,
            ![@UI.Importance] : #High,
            ![@HTML5.CssDefaults]: { width: '10rem' }
        },
    ]
);
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'id',
                Value : id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'stock',
                Value : stock,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Label : 'currency',
                Value : currency,
            },
            {
                $Type : 'UI.DataField',
                Label : 'author_id',
                Value : author_id,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
