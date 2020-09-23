using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using Shopping.Portal.Data.Helpers;
using Shopping.Portal.Data.Interface;
using Shopping.Portal.Model;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace Shopping.Portal.Data
{
    public class ProductRepository : DBConnections, IDisposable, IProductRepository
    {

        #region Product

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


      

        public SuccessModel<object> GetProductById(int productId)
        {
            try
            {
                object id = productId;
                var parameterList = new List<Tuple<string, object>>
                 {
                        Tuple.Create("@ProductId",id)
                 };
                DataSet executedSP = MasterHelperService.SqlConnectionSPHelper("GetProductById", parameterList);
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
                    ErrorMessage = "Failed"
                };
            }
        }
       
        public SuccessModel<object> GetProductByCategory(int categoryId)
        {
            try
            {
                object id = categoryId;
                var parameterList = new List<Tuple<string, object>>
                 {
                        Tuple.Create("@CategoryId",id)
                 };
                DataSet executedSP = MasterHelperService.SqlConnectionSPHelper("GetProductByCategory", parameterList);
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
                    ErrorMessage = "Failed"
                };
            }
        }


        #endregion

    }
}
