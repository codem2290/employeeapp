using {employee.demo.app as model } from '../db/employeeModel';
//@impl: 'employeeService'
service EmployeeSampleService {
    @odata.draft.enabled
    entity Employees as projection on model.Employees;
    entity Designation as projection on model.Designation;
    entity Company as projection on model.Company;
    entity LogEntryTable as projection on model.LogEntryTable;
    //entity FamilyMembers as projection on model.FamilyMembers;
    action setEmployeeStatusActivated(empID: String) returns String;
}