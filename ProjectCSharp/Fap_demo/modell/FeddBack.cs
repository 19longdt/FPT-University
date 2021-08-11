using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Fap_demo
{
    public class FeddBack
    {
        public int id { get; set; }
        public int idclass { get; set; }
        public string classname { get; set; }
        public string content { get; set; }
        public int idterm { get; set; }
        public int idteacher { get; set; }
        public string teacher { get; set; }
        public string course { get; set; }
        public string openDate { get; set; }
        public string closeDate { get; set; }
        public string contentdes { get; set; }
        public FeddBack()
        {

        }
        public FeddBack(string classname, string content, string teacher, string course)
        {
            this.classname = classname; this.content = content; this.teacher = teacher; this.course = course;
        }
        

            public FeddBack(int id, int idclass, string classname, string content, int idterm, int idteacher, string teacher, string course, string openDate, string closeDate, string cont)
        {
            this.id = id;
            this.idclass = idclass;
            this.classname = classname;
            this.content = content;
            this.idterm = idterm;
            this.idteacher = idteacher;
            this.teacher = teacher;
            this.course = course;
            this.openDate = openDate;
            this.closeDate = closeDate;
            this.contentdes = cont;
        }
    }
    class FeedBackList
    {
        public static List<FeddBack> GetAllFeedbackById(int sid, int tid)
        {
            List<FeddBack> List = new List<FeddBack>();
            DataTable dt = DAO.getFeedBackbyStuid(sid, tid);
            foreach (DataRow dr in dt.Rows)
            {
                FeddBack f = new FeddBack(
                    Convert.ToInt32(dr["id"]),
                    Convert.ToInt32(dr["idclass"].ToString()),
                    dr["name"].ToString(),
                    dr["content"].ToString(),
                    Convert.ToInt32(dr["idterm"]),
                    Convert.ToInt32(dr["idteacher"]),
                    dr["code"].ToString(),
                    dr["fullname"].ToString(),
                    DateTime.Parse(dr["openDate"].ToString()).ToString("dd/MM/yyyy"),
                    DateTime.Parse(dr["closeDate"].ToString()).ToString("dd/MM/yyyy"),
                    dr["contentDes"].ToString()
                    );
                List.Add(f);
            }
            return List;
        }
    }
}