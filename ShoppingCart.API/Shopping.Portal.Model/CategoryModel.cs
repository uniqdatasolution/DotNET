using System;
using System.Collections.Generic;
using System.Text;

namespace Shopping.Portal.Model
{
    public class CategoryModel
    {
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
        public string CategoryDescription { get; set; }
        public int CategoryType { get; set; }
        public int ParentId { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifiedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string CategoryImage { get; set; }
    }

  

    public class CategoryInfoManageModel
    {
        public object CategoryList { get; set; }
        public object CategoryTypeList { get; set; }
    }
}
