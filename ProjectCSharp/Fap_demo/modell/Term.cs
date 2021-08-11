using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Fap_demo
{
    public class Term
    {
        public int id { get; set; }
        public string name { get; set; }
        public DateTime datefrom { get; set; }
        public DateTime dateto { get; set; }
        public int idSemester { get; set; }
        public int idStudent { get; set; }
        public Term()
        {

        }
        public Term(int id, string name, DateTime datefrom, DateTime dateto, int idSemester, int idStudent)
        {
            this.id = id;
            this.name = name;
            this.datefrom = datefrom;
            this.dateto = dateto;
            this.idSemester = idSemester;
            this.idStudent = idStudent;
        }
    }
    class TermList
    {

        public static List<Term> GetAllTerm(int userid)
        {
            List<Term> List = new List<Term>();
            DataTable dt = DAO.getAllTerm();
            foreach (DataRow dr in dt.Rows)
            {
                //DateTime datenow = DateTime.Now;
                
                if (userid == Convert.ToInt32(dr["IDStudent"].ToString()))
                {
                    Term p = new Term(
                    Convert.ToInt32(dr["id"]),
                    dr["TermName"].ToString(),
                    DateTime.Parse(dr["DateFrom"].ToString()),
                    DateTime.Parse(dr["DateTo"].ToString()),
                    Convert.ToInt32(dr["IDSemester"].ToString()),
                    Convert.ToInt32(dr["IDStudent"].ToString())
                    );
                    List.Add(p);
                }
            }
            return List;
        }

    }
}