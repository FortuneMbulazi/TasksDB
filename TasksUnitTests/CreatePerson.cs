using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using Microsoft.Data.Tools.Schema.Sql.UnitTesting;
using Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace TasksUnitTests
{
    [TestClass()]
    public class CreatePerson : SqlDatabaseTestClass
    {

        public CreatePerson()
        {
            InitializeComponent();
        }

        [TestInitialize()]
        public void TestInitialize()
        {
            base.InitializeTest();
        }
        [TestCleanup()]
        public void TestCleanup()
        {
            base.CleanupTest();
        }

        #region Designer support code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction CreatePersonTest_TestAction;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(CreatePerson));
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.RowCountCondition CountNumberOfRows;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction ExistingEmailWillFailToCreateUser_TestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ScalarValueCondition scalarValueCondition1;
            this.CreatePersonTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            this.ExistingEmailWillFailToCreateUserData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            CreatePersonTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            CountNumberOfRows = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.RowCountCondition();
            ExistingEmailWillFailToCreateUser_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            scalarValueCondition1 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ScalarValueCondition();
            // 
            // CreatePersonTest_TestAction
            // 
            CreatePersonTest_TestAction.Conditions.Add(CountNumberOfRows);
            resources.ApplyResources(CreatePersonTest_TestAction, "CreatePersonTest_TestAction");
            // 
            // CreatePersonTestData
            // 
            this.CreatePersonTestData.PosttestAction = null;
            this.CreatePersonTestData.PretestAction = null;
            this.CreatePersonTestData.TestAction = CreatePersonTest_TestAction;
            // 
            // CountNumberOfRows
            // 
            CountNumberOfRows.Enabled = true;
            CountNumberOfRows.Name = "CountNumberOfRows";
            CountNumberOfRows.ResultSet = 1;
            CountNumberOfRows.RowCount = 1;
            // 
            // ExistingEmailWillFailToCreateUserData
            // 
            this.ExistingEmailWillFailToCreateUserData.PosttestAction = null;
            this.ExistingEmailWillFailToCreateUserData.PretestAction = null;
            this.ExistingEmailWillFailToCreateUserData.TestAction = ExistingEmailWillFailToCreateUser_TestAction;
            // 
            // ExistingEmailWillFailToCreateUser_TestAction
            // 
            ExistingEmailWillFailToCreateUser_TestAction.Conditions.Add(scalarValueCondition1);
            resources.ApplyResources(ExistingEmailWillFailToCreateUser_TestAction, "ExistingEmailWillFailToCreateUser_TestAction");
            // 
            // scalarValueCondition1
            // 
            scalarValueCondition1.ColumnNumber = 1;
            scalarValueCondition1.Enabled = true;
            scalarValueCondition1.ExpectedValue = "Email already in use";
            scalarValueCondition1.Name = "scalarValueCondition1";
            scalarValueCondition1.NullExpected = false;
            scalarValueCondition1.ResultSet = 1;
            scalarValueCondition1.RowNumber = 1;
        }

        #endregion


        #region Additional test attributes
        //
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        #endregion

        [TestMethod()]
        public void CreatePersonTest()
        {
            SqlDatabaseTestActions testActions = this.CreatePersonTestData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            SqlExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            try
            {
                // Execute the test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
                SqlExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            }
            finally
            {
                // Execute the post-test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
                SqlExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
            }
        }
        [TestMethod()]
        public void ExistingEmailWillFailToCreateUser()
        {
            SqlDatabaseTestActions testActions = this.ExistingEmailWillFailToCreateUserData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            SqlExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            try
            {
                // Execute the test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
                SqlExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            }
            finally
            {
                // Execute the post-test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
                SqlExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
            }
        }

        private SqlDatabaseTestActions CreatePersonTestData;
        private SqlDatabaseTestActions ExistingEmailWillFailToCreateUserData;
    }
}
