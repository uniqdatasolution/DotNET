using Shopping.Portal.Data.Interface;
using Shopping.Portal.Model;
using HDFC.Core.Logging;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shopping.Portal.Business
{
    public class CategoryManager
    {
        private readonly ICategoryRepository _catRepository;

        public CategoryManager(ICategoryRepository catRepository)
        {
            _catRepository = catRepository;
        }
        public SuccessModel<List<CategoryModel>> GetCategoryList()
        {
            NLogManager.Info("GetCategoryList - Category List");
            return _catRepository.GetCategoryList();
        }
        public SuccessModel<List<CategoryModel>> GetCategoryListForCustomer()
        {
            NLogManager.Info("GetCategoryList - Category List For Cusomter");
            return _catRepository.GetCategoryListForCustomerList();
        }
        public SuccessModel<CategoryInfoManageModel> GetCategoryDetailsForDP()
        {
            NLogManager.Info("GetCategoryDetailsForDP - Cat details");
            return _catRepository.GetCategoryDetailsForDP();
        }
        public SuccessModel<object> GetCategoryById(int categoryId)
        {
            NLogManager.Info("GetCategoryById-by id");
            return _catRepository.GetCategoryById(categoryId);
        }

     
        
        public SuccessModel<object> GetCategoryByCategoryType(int categoryType)

        {
            NLogManager.Info("GetCategoryByCategoryType - GetCategoryByCategoryType start");
            return _catRepository.GetCategoryByCategoryType(categoryType);
        }
    }
}
