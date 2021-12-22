using System.Web;
using System.Web.Mvc;

namespace BTL_ASP_HieuHaiSan
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
