using BTL_ASP_HieuHaiSan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_ASP_HieuHaiSan.DAO
{
    public class TinTucDAO
    {
        HaiSanDB db = new HaiSanDB();
        public dynamic getTintuc()
        {
            var tintuc = from t in db.TinTuc_VaoBep
                         where t.Status == true
                         select t;
            return tintuc;
        }
        public dynamic getVaobep()
        {
            var vaobep = from t in db.TinTuc_VaoBep
                         where t.Status == false
                         select t;
            return vaobep;
        }
        public List<TinTuc_VaoBep> getTop6TinTuc()
        {
            List<TinTuc_VaoBep> lstTinTuc = (from t in db.TinTuc_VaoBep where t.Status==true orderby t.NgayTao select t).Take(6).ToList();
            return lstTinTuc;
        }
        public List<TinTuc_VaoBep> getTop6VaoBep()
        {
            List<TinTuc_VaoBep> lstVaoBep = (from t in db.TinTuc_VaoBep where t.Status == false orderby t.NgayTao select t).Take(6).ToList();
            return lstVaoBep;
        }
        public dynamic findById(int id)
        {
            var tintuc = (from s in db.TinTuc_VaoBep where s.ID_TinTuc == id select s).FirstOrDefault();
            return tintuc;
        }
    }
}