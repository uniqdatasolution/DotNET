using Shopping.Portal.Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shopping.Portal.Data.Interface
{
    public interface ICategoryRepository
    {
        SuccessModel<List<CategoryModel>> GetCategoryList();
        SuccessModel<List<CategoryModel>> GetCategoryListForCustomerList();
        SuccessModel<CategoryInfoManageModel> GetCategoryDetailsForDP();
        SuccessModel<object> GetCategoryById(int categoryId);
        SuccessModel<object> GetCategoryByCategoryType(int categoryType);
    }
}
