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
    public class ShoppingCartRepository : DBConnections, IDisposable, IShoppingCartRepository
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
        
        public SuccessModel<object> SaveCartItem(ShoppingCartModel model)
        {
            try
            {
                string message = string.Empty;
                var parameterList = new List<Tuple<string, object>>
                 {
                        Tuple.Create("@CustomerId",model.CustomerId),
                        Tuple.Create("@ProductId",model.ProductId),
                        Tuple.Create("@Quantity",model.Quantity == null ? default(int) : model.Quantity),
                                  
                };

                DataSet executedSP = MasterHelperService.SqlConnectionSPHelper("SaveShoppingItem", parameterList);


            
                return new SuccessModel<object>()
                {
                    Data = "Save Successfully",
                    ErrorMessage = null
                };
            }
            catch (Exception ex)
            {
                return new SuccessModel<object>()
                {
                    Data = "Something went wrong",
                    ErrorMessage = "Failed"
                };
                //  throw ex;
            }
        }
        public SuccessModel<object> UpdateCartItem(ShoppingCartModel model)
        {
            try
            {
                string message = string.Empty;
                var parameterList = new List<Tuple<string, object>>
                 {
                        Tuple.Create("@CartId",model.CustomerId),
                        Tuple.Create("@Quantity",model.Quantity == null ? default(int) : model.Quantity),
                                  
                };

                DataSet executedSP = MasterHelperService.SqlConnectionSPHelper("UpdateShoppingItem", parameterList);


            
                return new SuccessModel<object>()
                {
                    Data = "Save Successfully",
                    ErrorMessage = null
                };
            }
            catch (Exception ex)
            {
                return new SuccessModel<object>()
                {
                    Data = "Something went wrong",
                    ErrorMessage = "Failed"
                };
                //  throw ex;
            }
        }

        public SuccessModel<object> RemoveCartItem(int cartId)
        {
            try
            {
                string message = string.Empty;
                object _cartId = cartId;
                var parameterList = new List<Tuple<string, object>>
                 {
                        Tuple.Create("@CartId",_cartId)

                };

                DataSet executedSP = MasterHelperService.SqlConnectionSPHelper("RemoveShoppingItem", parameterList);

                return new SuccessModel<object>()
                {
                    Data = "Save Successfully",
                    ErrorMessage = null
                };
            }
            catch (Exception ex)
            {
                return new SuccessModel<object>()
                {
                    Data = "Something went wrong",
                    ErrorMessage = "Failed"
                };
                //  throw ex;
            }
        }


        public SuccessModel<List<ShoppingCartModel>> GetCartList(int customerId)
        {
            try
            {

                return new SuccessModel<List<ShoppingCartModel>>()
                {
                    Data = SQLDB.ExecuteSprocAccessor<ShoppingCartModel>("GetShoppingCart", customerId).ToList(),
                    ErrorMessage = null
                };
            }
            catch (Exception ex)
            {
                return new SuccessModel<List<ShoppingCartModel>>()
                {
                    Data = null,
                    ErrorMessage = "Failed"
                };
            }
        }
    }

}

