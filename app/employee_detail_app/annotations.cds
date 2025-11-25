using EmployeeSampleService as service from '../../srv/employeeService';
using from '../../db/employeeModel';

annotate service.Employees with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : employeeId,
            Label : '{i18n>Id}',
        },
        {
            $Type : 'UI.DataField',
            Value : email,
            Label : '{i18n>Email}',
        },
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : '{i18n>Name}',
        },
        {
            $Type : 'UI.DataField',
            Value : designation.name,
            Label : '{i18n>Designation}',
        },
        {
            $Type : 'UI.DataField',
            Value : phone,
            Label : '{i18n>Phone}',
        },
        {
            $Type : 'UI.DataField',
            Value : address,
            Label : '{i18n>Address}',
        },
    ],
    UI.SelectionFields : [
        designation_code,
    ],
    UI.HeaderInfo: {
        TypeNamePlural : 'Employee List',
    },
    UI.DataPoint #name : {
        $Type : 'UI.DataPointType',
        Value : name,
        Title : '{i18n>Name}',
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'name',
            Target : '@UI.DataPoint#name',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'name1',
            Target : 'designation/@UI.DataPoint#name',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'email',
            Target : '@UI.DataPoint#email',
        },
    ],
    UI.DataPoint #company : {
        $Type : 'UI.DataPointType',
        Value : company,
        Title : '{i18n>Company}',
    },
    UI.DataPoint #email : {
        $Type : 'UI.DataPointType',
        Value : email,
        Title : '{i18n>Email}',
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>FamilyMemberDetails}',
            ID : 'i18nFamilyMemberDetails',
            Target : 'familyMembers/@UI.LineItem#i18nFamilyMemberDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>EmployeeDetails}',
            ID : 'i18nEmployeeDetails',
            Target : '@UI.FieldGroup#i18nEmployeeDetails',
        },
    ],
    UI.FieldGroup #i18nEmployeeDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : employeeId,
                Label : 'employeeId',
            },
            {
                $Type : 'UI.DataField',
                Value : name,
                Label : 'name',
            },
            {
                $Type : 'UI.DataField',
                Value : email,
                Label : 'email',
            },
            {
                $Type : 'UI.DataField',
                Value : phone,
                Label : 'phone',
            },
            {
                $Type : 'UI.DataField',
                Value : address,
                Label : 'address',
            },
            {
                $Type : 'UI.DataField',
                Value : company_code,
                Label : 'Company',
            },
            {
                $Type : 'UI.DataField',
                Value : age,
                Label : 'age',
            },
            {
                $Type : 'UI.DataField',
                Value : salary,
                Label : 'salary',
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
        ],
    },
);

annotate service.Employees with {
    designation @(
        Common.Label : '{i18n>Designation}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Designation',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : designation_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : false,
    )
};

annotate service.Designation with {
    code @(
        Common.Text : name,
        Common.Text.@UI.TextArrangement : #TextOnly,
)};

annotate service.Designation with @(
    UI.DataPoint #name : {
        $Type : 'UI.DataPointType',
        Value : name,
        Title : '{i18n>Designation}',
    }
);

annotate service.FamilyMembers with @(
    UI.LineItem #i18nFamilyMemberDetails : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : '{i18n>Name}',
        },
        {
            $Type : 'UI.DataField',
            Value : phone,
            Label : '{i18n>Phone}',
        },
        {
            $Type : 'UI.DataField',
            Value : relationShip,
            Label : '{i18n>Relationship}',
        },
        {
            $Type : 'UI.DataField',
            Value : email,
            Label : '{i18n>Email}',
        },
        {
            $Type : 'UI.DataField',
            Value : gender,
            Label : '{i18n>Gender}',
        },
        {
            $Type : 'UI.DataField',
            Value : address,
            Label : '{i18n>Address}',
        },
    ]
);

annotate service.Employees with {
    company @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Company',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : company_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : company.name,
        Common.Text.@UI.TextArrangement : #TextOnly,
        Common.FieldControl : #Mandatory,
)};

annotate service.Company with {
    code @(
        Common.Text : name,
        Common.Text.@UI.TextArrangement : #TextOnly,
)};

