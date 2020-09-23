using Shopping.Portal.Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shopping.Portal.Data.Interface
{
    public interface IMasterRepository
    {
        SuccessModel<List<ColorMaster>> GetColorList();
        SuccessModel<List<BrandMaster>> GetBrandList();
        SuccessModel<List<SizeMaster>> GetSizeList();
    }
}
