using Shopping.Portal.Data.Interface;
using Shopping.Portal.Model;
using HDFC.Core.Logging;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shopping.Portal.Business
{
    public class MasterManager
    {
        private readonly IMasterRepository _masterRepository;
        public MasterManager(IMasterRepository masterRepository)
        {
            _masterRepository = masterRepository;
        }
        public SuccessModel<List<ColorMaster>> GetColorList()
        {
            NLogManager.Info("MasterManager - GetColorList started");
            return _masterRepository.GetColorList();
        }
       

        public SuccessModel<List<BrandMaster>> GetBrandList()
        {
            NLogManager.Info("MasterManager - GetBrandList started");
            return _masterRepository.GetBrandList();
        }

        public SuccessModel<List<SizeMaster>> GetSizeList()
        {
            NLogManager.Info("MasterManager - GetSizeList started");
            return _masterRepository.GetSizeList();
        }



    }
}
