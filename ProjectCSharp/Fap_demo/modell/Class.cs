using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fap_demo
{
    public class Class
    {
        public int id { get; set; }
        public string name { get; set; }
        public int idterm { get; set; }
        public int idteacher { get; set; }
        public int idcourse { get; set; }
        public string course { get; set; }
        public int[] idstudent { get; set; }
        public string[] studentname { get; set; }

        public Class(int id, string name, int idterm, int idteacher, string[] studentname)
        {
            this.id = id;
            this.name = name;
            this.idterm = idterm;
            this.idteacher = idteacher;
            this.studentname = studentname;
        }

        public Class(int id, string name, int idterm, int idteacher, int idcourse, string course, int[] idstudent)
        {
            this.id = id;
            this.name = name;
            this.idterm = idterm;
            this.idteacher = idteacher;
            this.idcourse = idcourse;
            this.course = course;
            this.idstudent = idstudent;
        }
    }
}