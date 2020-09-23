using Shopping.Portal.Data.Helpers;
using Shopping.Portal.Data.Interface;
using Shopping.Portal.Model;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;

namespace Shopping.Portal.Data
{
    public class CategoryRepository : DBConnections, IDisposable, ICategoryRepository
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

        public SuccessModel<List<CategoryModel>> GetCategoryList()
        {
            try
            {
                return new SuccessModel<List<CategoryModel>>()
                {
                    Data = SQLDB.ExecuteSprocAccessor<CategoryModel>("GetCategoryList").ToList(),
                    ErrorMessage = null
                };
            }
            catch (Exception ex)
            {
                return new SuccessModel<List<CategoryModel>>()
                {
                    ErrorMessage = ex.Message,
                    Data = null
                };
            }
        }

        public SuccessModel<List<CategoryModel>> GetCategoryListForCustomerList()
        {
            try
            {
                return new SuccessModel<List<CategoryModel>>()
                {
                    Data = SQLDB.ExecuteSprocAccessor<CategoryModel>("GetCategoryListForCustomer").ToList(),
                    ErrorMessage = null
                };
            }
            catch (Exception ex)
            {
                return new SuccessModel<List<CategoryModel>>()
                {
                    ErrorMessage = ex.Message,
                    Data = null
                };
            }
        }
        
        public SuccessModel<CategoryInfoManageModel> GetCategoryDetailsForDP()
        {
            try
            {
                object id = 3;
                var parameterList = new List<Tuple<string, object>>
                 {
                        Tuple.Create("@EntityId",id)
                 };
                DataSet executedSP = MasterHelperService.SqlConnectionSPHelper("GetCategoryList", null);
                DataSet executedSPCT = MasterHelperService.SqlConnectionSPHelper("GetReferenceDataValueByEntity", parameterList);
                return new SuccessModel<CategoryInfoManageModel>()
                {
                    Data = new CategoryInfoManageModel()
                    {
                        CategoryList = executedSP.Tables[0],
                        CategoryTypeList = executedSPCT.Tables[0],
                    },
                    ErrorMessage = null
                };
            }
            catch (Exception ex)
            {
                return new SuccessModel<CategoryInfoManageModel>() { Data = null, ErrorMessage = ex.Message };
            }
        }

        public SuccessModel<object> GetCategoryById(int categoryId)
        {
            try
            {
                object id = categoryId;
                var parameterList = new List<Tuple<string, object>>
                 {
                        Tuple.Create("@CategoryId",id)
                 };
                DataSet executedSP = MasterHelperService.SqlConnectionSPHelper("GetCategoryById", parameterList);
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
                
        public SuccessModel<object> GetCategoryByCategoryType(int categoryType)

        {
            try
            {
                object id = categoryType;
                var parameterList = new List<Tuple<string, object>>
                 {
                        Tuple.Create("@CategoryType",id)
                 };
                DataSet executedSP = MasterHelperService.SqlConnectionSPHelper("GetCategoryByCategoryType", parameterList);
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
