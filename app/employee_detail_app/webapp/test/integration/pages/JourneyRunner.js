sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/demo/employee/employeedetailapp/test/integration/pages/EmployeesList",
	"com/demo/employee/employeedetailapp/test/integration/pages/EmployeesObjectPage"
], function (JourneyRunner, EmployeesList, EmployeesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/demo/employee/employeedetailapp') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeesList: EmployeesList,
			onTheEmployeesObjectPage: EmployeesObjectPage
        },
        async: true
    });

    return runner;
});

