using Shopping.Portal.Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shopping.Portal.Data.Interface
{
    public interface IProductRepository
    {
        SuccessModel<object> GetProductById(int Id);
        SuccessModel<object> GetProductByCategory(int categoryId);
    }
}
