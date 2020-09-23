using HDFC.Core.Common;
using Shopping.Portal.Data.Interface;
using Shopping.Portal.Model;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Shopping.Portal.Data.Helpers;
using Shopping.Portal.Data;
using System.Linq;
using System.Data.Common;

namespace HDFC.Portal.Data
{
    public class CustomerRepository : DBConnections, IDisposable, ICustomerRepository
    {
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                // free managed resources
            }
            // free native resources if there are any.
        }
        
        public DataValidationModel<object> CustometInsertOrUpdate(CustomerIUModel customer)

        {
            try
            {
                string message = string.Empty;
                var parameterList = new List<Tuple<string, object>>
                 {
                        Tuple.Create("@CustomerId",customer.CustomerId == null ? default(int) : customer.CustomerId),
                        Tuple.Create("@ContactEmail",customer.ContactEmail),
                        Tuple.Create("@LoginPassword",MasterHelperService.EncodePasswordToBase64(customer.LoginPassword)),
                        Tuple.Create("@FirstName",customer.FirstName),
                        Tuple.Create("@LastName",customer.LastName),
                        Tuple.Create("@Address1",customer.Address1),
                        Tuple.Create("@Address2",customer.Address2),
                        Tuple.Create("@ContactMobile",customer.ContactMobile),
            
                };

                DataSet executedSP = MasterHelperService.SqlConnectionSPHelper("SaveCustomer", parameterList);



                var isExist = false; var isNewCreated = false; var id = default(int);
                for (int i = 0; i < executedSP.Tables[0].Rows.Count; i++)
                {
                    isExist = Convert.ToBoolean(executedSP.Tables[0].Rows[i]["IsExist"]);
                    isNewCreated = Convert.ToBoolean(executedSP.Tables[0].Rows[i]["IsNewCreated"]);
                    id = Convert.ToInt32(executedSP.Tables[0].Rows[i]["Id"]);
                }
           

                return new DataValidationModel<object>()
                {
                    Data = GetCustomerById(id),
                    IsExist = isExist,
                    ErrorMessage = null
                };
            }
            catch (Exception ex)
            {
                //return new DataValidationModel<string>()
                //{
                //    Data = "Something went wrong",
                //    ErrorMessage = "Failed"
                //};
                throw ex;
            }
        }
        public SuccessModel<LoginResponseModel> ValidateCustomer(LoginMaster loginUser)


        {
            try
            {
                var data = MasterHelperService.ValidatingUserForAll(loginUser, "CUSTOMER");
                if (data.Item1)
                {
                    var custData = GetCustomerById(data.Item2);
                    return new SuccessModel<LoginResponseModel>()
                    {
                        Data = new LoginResponseModel() { Data = custData.Data, IsExist = data.Item1 }
                    };
                }
                else
                {
                    return new SuccessModel<LoginResponseModel>()
                    {
                        Data = new LoginResponseModel() { IsExist = data.Item1, Data = null }
                    };
                }

            }
            catch (Exception ex)
            {
                return new SuccessModel<LoginResponseModel>() { Data = null, ErrorMessage = ex.Message };
            }
        }

        public SuccessModel<object> GetCustomerById(int customerId)

        {
            try
            {
                object id = customerId;
                var parameterList = new List<Tuple<string, object>>
                 {
                        Tuple.Create("@CustomerId",id)
                 };
                DataSet executedSP = MasterHelperService.SqlConnectionSPHelper("GetCustomerById", parameterList);
                return new SuccessModel<object>()
                {
                    Data = executedSP.Tables[0],
                    ErrorMessage = null
                };
            }
            catch (Exception ex)
            {
                return new SuccessModel<object>()
                {
                    Data = null,
                    ErrorMessage = ex.Message
                };
            }
        }
    }

}

