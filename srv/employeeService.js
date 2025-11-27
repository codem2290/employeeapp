const cds = require('@sap/cds');
const { message } = require('@sap/cds/lib/log/cds-error');
const { INSERT, UPDATE } = require('@sap/cds/lib/ql/cds-ql');
const { target } = require('@sap/cds/lib/ql/cds.ql-infer');
class EmployeeSampleService extends cds.ApplicationService {
    init() {
        let { Employees, LogEntryTable } = this.entities;
        this.before('UPDATE', Employees.drafts, (req) => {
            debugger;
            if (req.data?.email) {
                let expression = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                let output = expression.test(req.data?.email);
                if (output === false) {
                    req.error({
                        target: 'email',
                        message: "Invalid Email Address"
                    });
                }
            }
        });

        this.on('READ', Employees, async (req) => {
            let data = await cds.run(req.query);
            return data;
        });

        this.after('CREATE', Employees.drafts, async (req) => {
            debugger;
        });

        this.after('CREATE', Employees, async (req) => {
            let created = await INSERT.into(LogEntryTable).entries([{
                desciption: "Employee entry added",
                tableName: "Employees"
            }]);
        });

        this.on('setEmployeeStatusActivated', async (req) => {
            debugger;
            let empId = req.data.empID;
            if (empId) {
                let data = await UPDATE(Employees, empId).with({
                    status: "Activated"
                });
                if (!data) {
                    return req.reject(400, "Failed to update Status!");
                }
                return {
                    "message": "Status Updated!!"
                }
            }
        });

        return super.init();
    }
}

module.exports = EmployeeSampleService;