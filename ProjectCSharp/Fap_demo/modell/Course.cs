using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Fap_demo
{
    public class Course
    {
        public int id { get; set; }
        public string courseName { get; set; }
        public string fullname { get; set; }
        public int cid { get; set; }
        public string date { get; set; }
        public Course()
        {

        }

        public Course(int id, string courseName, string fullname, int cid, string date)
        {
            this.id = id;
            this.courseName = courseName;
            this.fullname = fullname;
            this.cid = cid;
            this.date = date;
        }
        public Course(int id, string courseName, string date, string fullname, int idcate)
        {
            this.id = id;
            this.courseName = courseName;
            this.date = date;
            this.fullname = fullname;
            this.cid = idcate;
        }
    }
    class CourseList
    {

        public static List<Course> GetAllCourse(int tid, int uid)
        {
            List<Course> List = new List<Course>();
            DataTable dt = DAO.getCourseByTermUser(tid, uid);
            foreach (DataRow dr in dt.Rows)
            {
                Course p = new Course(
                    Convert.ToInt32(dr["id"]),
                    dr["CourseName"].ToString(),
                    dr["DateFrom"].ToString(),
                    dr["fullname"].ToString(),
                    Convert.ToInt32(dr["idcate"])
                    );
                List.Add(p);
            }
            return List;
        }
    }
}