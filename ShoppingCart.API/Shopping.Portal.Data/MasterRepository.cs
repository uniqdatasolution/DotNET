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
    public class MasterRepository : DBConnections, IDisposable, IMasterRepository
    {

        #region Master

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
              
       
        public SuccessModel<List<ColorMaster>> GetColorList()
        {
            try
            {
              
                return new SuccessModel<List<ColorMaster>>()
                {
                    Data = SQLDB.ExecuteSprocAccessor<ColorMaster>("GetColorList").ToList(),
                    ErrorMessage = null
                };
            }
            catch (Exception ex)
            {
                return new SuccessModel<List<ColorMaster>>()
                {
                    Data = null,
                    ErrorMessage = "Failed"
                };
            }
        }

        public SuccessModel<List<BrandMaster>> GetBrandList()
        {
            try
            {

                return new SuccessModel<List<BrandMaster>>()
                {
                    Data = SQLDB.ExecuteSprocAccessor<BrandMaster>("GetBrandList").ToList(),
                    ErrorMessage = null
                };
            }
            catch (Exception ex)
            {
                return new SuccessModel<List<BrandMaster>>()
                {
                    Data = null,
                    ErrorMessage = "Failed"
                };
            }
        }

        public SuccessModel<List<SizeMaster>> GetSizeList()
        {
            try
            {

                return new SuccessModel<List<SizeMaster>>()
                {
                    Data = SQLDB.ExecuteSprocAccessor<SizeMaster>("GetSizeList").ToList(),
                    ErrorMessage = null
                };
            }
            catch (Exception ex)
            {
                return new SuccessModel<List<SizeMaster>>()
                {
                    Data = null,
                    ErrorMessage = "Failed"
                };
            }
        }


        #endregion

    }
}
