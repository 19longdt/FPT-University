using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Fap_demo
{
    public class AppType
    {
        public int id { get; set; }
        public string name { get; set; }
        public double money { get; set; }
        public AppType()
        {

        }
        public AppType(int id, string name, double money)
        {
            this.id = id;
            this.name = name;
            this.money = money;
        }
        public AppType(int id, string name)
        {
            this.id = id;
            this.name = name;
        }
    }
    class AppTypeList
    {
        public static List<AppType> getListAppType()
        {
            List<AppType> List = new List<AppType>();
            DataTable dt = DAO.getAppType();
            foreach (DataRow dr in dt.Rows)
            {
                AppType p = new AppType(
                    Convert.ToInt32(dr["id"]),
                    dr["name"].ToString(),
                    Convert.ToDouble(dr["money"].ToString())
                    );
                List.Add(p);
            }
            return List;
        }
        public static List<AppType> getListAppTypebyStatus()
        {
            List<AppType> List = new List<AppType>();
            DataTable dt = DAO.getTypeRequetbyStatus();
            foreach (DataRow dr in dt.Rows)
            {
                AppType p = new AppType(
                    Convert.ToInt32(dr["id"]),
                    dr["name"].ToString()
                    );
                List.Add(p);
            }
            return List;
        }
        public static List<AppType> getListAppTypeWithItemAll()
        {
            List<AppType> appType = getListAppType();
            appType.Insert(0, new AppType(0, "Choose Application Type (Chọn loại đơn)", 0));
            return appType;
        }
        public static List<AppType> getListAppTypeWithItemAllbystatus()
        {
            List<AppType> appType = getListAppTypebyStatus();
            appType.Insert(0, new AppType(0, "ALL"));
            return appType;
        }
    }
}