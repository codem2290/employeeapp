namespace employee.demo.app;

using {
    managed,
    cuid
} from '@sap/cds/common';

aspect commonfields {
    name    : String(50);
    email   : String(50);
    address : String;
    phone   : String;
}

type age : Integer;

entity Employees : managed, commonfields {
    key employeeId    : UUID;
        // name        : String(50);
        // email       : String(50);
        // address     : String;
        designation   : Association to Designation;
        company       : String(50);
        age           : age;
        salary        : Decimal(10, 2);
        familyMembers : Composition of many FamilyMembers
                            on familyMembers.employee = $self;
}

entity FamilyMembers : managed, cuid, commonfields {
    relationShip : String;
    gender       : String;
    employeeId   : String;
    employee     : Association to Employees
                       on employee.employeeId = employeeId; // Managed Assocaition
}

entity Designation {
    key code: String;
    name: String;
}