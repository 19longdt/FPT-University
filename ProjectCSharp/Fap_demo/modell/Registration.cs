using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Fap_demo
{
    public class Registration
    {
        public int id { get; set; }
        public int idtype { get; set; }
        public string purpose { get; set; }
        public string filename { get; set; }
        public string sendDate { get; set; }
        public string closeDate { get; set; }
        public int idstudent { get; set; }
        public string processnote { get; set; }
        public string status { get; set; }
        public int sta { get; set; }
        public Registration()
        {
        }
        public Registration(int id, int idtype, string purpose, string filename, string sendDate, string closeDate, int idstudent)
        {
            this.id = id;
            this.idtype = idtype;
            this.purpose = purpose;
            this.filename = filename;
            this.sendDate = sendDate;
            this.closeDate = closeDate;
            this.idstudent = idstudent;
        }
        public Registration(int id, string closeDate, string processnote, int sta)
        {
            this.id = id;
            this.closeDate = closeDate;
            this.processnote = processnote;
            this.sta = sta;
        }

        public Registration(int id, string purpose, string filename, string sendDate, string closeDate, string processnote, string status)
        {
            this.id = id;
            this.purpose = purpose;
            this.filename = filename;
            this.sendDate = sendDate;
            this.closeDate = closeDate;
            this.processnote = processnote;
            this.status = status;
        }
        public Registration(int id, string purpose, string filename, string sendDate)
        {
            this.id = id;
            this.purpose = purpose;
            this.filename = filename;
            this.sendDate = sendDate;
        }
        public Registration(int id, string purpose, string filename, string sendDate, string closeDate)
        {
            this.id = id;
            this.purpose = purpose;
            this.filename = filename;
            this.sendDate = sendDate;
            this.closeDate = closeDate;
        }
        public Registration(int idtype, string purpose, string filename, string sendDate, string closeDate, int idstudent)
        {
            this.idtype = idtype;
            this.purpose = purpose;
            this.filename = filename;
            this.sendDate = sendDate;
            this.closeDate = closeDate;
            this.idstudent = idstudent;
        }

    }
    class Regislist
    {
        public static List<Registration> getRequestbyStatusAndIDType(int type, int check)
        {
            List<Registration> List = new List<Registration>();
            DataTable dt = DAO.getRequestbyStatusAndIDType(type, check);

            foreach (DataRow dr in dt.Rows)
            {
                Registration p = new Registration(
                       Convert.ToInt32(dr["id"]),
                       dr["purpose"].ToString(),
                       dr["filename"].ToString(),
                       dr["sendDate"].ToString(),
                       DateTime.Now.ToString()
                       );
                List.Add(p);
            }
            return List;
        }



        public static List<Registration> getListRegistrationbysid(int sid)
        {
            List<Registration> List = new List<Registration>();
            DataTable dt = DAO.getRequestBySid(sid);
            foreach (DataRow dr in dt.Rows)
            {
                Registration p = new Registration();
                if (dr["closeDate"].ToString().Equals("") || dr["PROCESSNOTE"].ToString().Equals("") || dr["status"].ToString().Equals(""))
                {
                    p = new Registration(
                       Convert.ToInt32(dr["id"]),
                       dr["purpose"].ToString(),
                       dr["filename"].ToString(),
                       dr["sendDate"].ToString(),
                       "", "", "In Process"
                       );
                }
                else
                {
                    string s = "";
                    if (!dr["status"].ToString().Equals("") && Convert.ToInt32(dr["status"]) == 1)
                    {
                        s = "Rejected";
                    }
                    else if (!dr["status"].ToString().Equals("") && Convert.ToInt32(dr["status"]) == 2)
                    {
                        s = "Approved";
                    }
                    p = new Registration(
                      Convert.ToInt32(dr["id"]),
                      dr["purpose"].ToString(),
                      dr["filename"].ToString(),
                      dr["sendDate"].ToString(),
                      dr["closeDate"].ToString(), dr["PROCESSNOTE"].ToString(), s
                      );
                }

                List.Add(p);
            }
            return List;
        }

    }
}