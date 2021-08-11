using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fap_demo
{
    public class MarkReport
    {
        public int id { get; set; }
        public int idTerm { get; set; }
        public int idCourse { get; set; }
        public string rollNumber { get; set; }
        public int[] mark { get; set; }
        public int status { get; set; }

        public MarkReport(int id, int idTerm, int idCourse, string rollNumber, int[] mark, int status)
        {
            this.id = id;
            this.idTerm = idTerm;
            this.idCourse = idCourse;
            this.rollNumber = rollNumber;
            this.mark = mark;
            this.status = status;
        }
    }
}