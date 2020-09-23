using Shopping.Portal.Data.Interface;
using Shopping.Portal.Model;
using HDFC.Core.Logging;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shopping.Portal.Business
{
    public class ProductManager
    {
        private readonly IProductRepository _productRepository;
        public ProductManager(IProductRepository productRepository)
        {
            _productRepository = productRepository;
        }
  
       

        public SuccessModel<object> GetProductById(int Id)
        {
            NLogManager.Info("ProductManager - GetProductById started");
            return _productRepository.GetProductById(Id);
        }
 

       

        public SuccessModel<object> GetProductByCategory(int categoryId)
        {
            NLogManager.Info("ProductManager - GetProductByCategory started");
            return _productRepository.GetProductByCategory(categoryId);
        }

    }
}
