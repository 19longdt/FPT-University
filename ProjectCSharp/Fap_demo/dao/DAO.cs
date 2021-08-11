using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


namespace Fap_demo
{
    public class DAO
    {
        public static SqlConnection GetConnection()
        {
            string conStr = ConfigurationManager.ConnectionStrings["Fap_DemoContr"].ToString();
            return new SqlConnection(conStr);
        }

        public static DataTable GetDataBySql(string sql)
        {
            SqlCommand command = new SqlCommand(sql, GetConnection()); ////bat dau truy van
            SqlDataAdapter adapter = new SqlDataAdapter(command); //chuyen du lieu ve
            DataSet ds = new DataSet(); //tạo một kho ảo để lưu trữ dữ liệu
            adapter.Fill(ds); // đổ dữ liệu vào kho
            return ds.Tables[0];
        }

        public static void runSqlWithParameter(string sql, params SqlParameter[] parametes)
        {
            SqlCommand command = new SqlCommand(sql, GetConnection());
            command.Parameters.AddRange(parametes);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
        }

        public static DataTable GetDataBySqlWithParameter(string sql, params SqlParameter[] parametes)
        {
            SqlCommand command = new SqlCommand(sql, GetConnection());
            command.Parameters.AddRange(parametes);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            return ds.Tables[0];
        }

        public static int getRole(int idUser)
        {
            string sql = "select  Role from Account where iduser = @u ";
            SqlParameter parameters = new SqlParameter();
            parameters = new SqlParameter("@u", SqlDbType.Int);
            parameters.Value = idUser;

            return Convert.ToInt32(GetDataBySqlWithParameter(sql, parameters).Rows[0][0]);
        }

        public static User getUser(User e)
        {
            string sql = "select IDUser, Role from Account where username = @user and password = @pass ";
            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = new SqlParameter("@user", SqlDbType.NVarChar);
            parameters[1] = new SqlParameter("@pass", SqlDbType.NVarChar);
            parameters[0].Value = e.username;
            parameters[1].Value = e.password;

            DataTable dt = GetDataBySqlWithParameter(sql, parameters);

            if(dt.Rows.Count < 1)
            {
                return null;
            }

                if (dt.Rows[0][0].ToString().Equals(""))
                {
                    return new User(e.username, e.password, Convert.ToInt32(dt.Rows[0][1]));
                }
                int id = Convert.ToInt32(dt.Rows[0][0]);
                if (Convert.ToInt32(dt.Rows[0][1].ToString()) == 0)
                {
                    string sql1 = "select * from Student where id = @id ";
                    SqlParameter p = new SqlParameter("@id", SqlDbType.Int);
                    p.Value = id;
                    DataTable dt1 = GetDataBySqlWithParameter(sql1, p);

                    int cityid = Convert.ToInt32(dt1.Rows[0][10]);
                    string sql2 = "select Cityname from VietNam_City where id = @cid ";
                    SqlParameter p1 = new SqlParameter("@cid", SqlDbType.Int);
                    p1.Value = cityid;
                    DataTable dt2 = GetDataBySqlWithParameter(sql2, p1);

                    int majorid = Convert.ToInt32(dt1.Rows[0][6]);
                    string sql3 = "select CateFullName from CourseCate where id = @fid ";
                    SqlParameter p2 = new SqlParameter("@fid", SqlDbType.Int);
                    p2.Value = majorid;
                    DataTable dt3 = GetDataBySqlWithParameter(sql3, p2);

                    User u = new User(id, dt1.Rows[0][1].ToString(), dt1.Rows[0][2].ToString(),
                        Convert.ToInt32(dt1.Rows[0][10].ToString()), dt1.Rows[0][4].ToString(),
                        dt1.Rows[0][5].ToString(), dt3.Rows[0][0].ToString(), dt1.Rows[0][7].ToString(),
                         Convert.ToInt32(dt1.Rows[0][8]), dt1.Rows[0][9].ToString(), Convert.ToDouble(dt1.Rows[0][11].ToString()));
                    return u;
                }
                else if (Convert.ToInt32(dt.Rows[0][1].ToString()) == 1)
                {
                    // dang lam do //
                    string sql1 = @"select t.*, a.Role 
                                    from Teacher t, Account a
                                    where t.id = @id and t.id = a.IDUser and role = 1";
                    SqlParameter p = new SqlParameter("@id", SqlDbType.Int);
                    p.Value = id;
                    DataTable dt1 = GetDataBySqlWithParameter(sql1, p);

                    return new User(id, dt1.Rows[0][1].ToString(), dt1.Rows[0][2].ToString(), Convert.ToInt32(dt1.Rows[0][3].ToString()), Convert.ToInt32(dt1.Rows[0][5].ToString()));
                }
                
            return null;
        }

        public static DataTable getAllTerm()
        {
            string sql = @"select t.*, td.* from termm t join TermDetails td on t.ID = td.ID";
            return GetDataBySqlWithParameter(sql);
        }
        public static DataTable getCity()
        {
            string sql = @"select [id] , [Cityname] from VietNam_City ";
            return GetDataBySqlWithParameter(sql);
        }

        public static DataTable getCourseByTermUser(int tid, int uid)
        {
            string sql = @"select c.ID, c.idcate , c.CourseName, td.DateFrom , c.fullname
                            from Termm t join TermDetails td  on t.ID = td.id 
                            join Semester s on t.IDSemester = s.id
                           join Course c on s.IDCourse = c.ID where t.ID = @tid and t.IDStudent = @uid";
            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = new SqlParameter("@tid", SqlDbType.Int);
            parameters[1] = new SqlParameter("@uid", SqlDbType.Int);
            parameters[0].Value = tid;
            parameters[1].Value = uid;
            return GetDataBySqlWithParameter(sql, parameters);
        }

        public static MarkReport getMarkReport(int idCourse, string rollNumber)
        {
            string sql = "select * from MarkReport where IDCourse = @idc and RollNumber = @roll";
            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = new SqlParameter("@idc", SqlDbType.Int);
            parameters[1] = new SqlParameter("@roll", SqlDbType.NVarChar);
            parameters[0].Value = idCourse;
            parameters[1].Value = rollNumber;

            DataTable dt = GetDataBySqlWithParameter(sql, parameters);

            if (dt.Rows.Count != 0)
            {
                int[] mark = new int[4];

                mark[0] = Convert.ToInt32(dt.Rows[0][4]);
                mark[1] = Convert.ToInt32(dt.Rows[0][5]);
                mark[2] = Convert.ToInt32(dt.Rows[0][6]);
                mark[3] = Convert.ToInt32(dt.Rows[0][7]);

                MarkReport mr = new MarkReport(Convert.ToInt32(dt.Rows[0][0]), Convert.ToInt32(dt.Rows[0][1]), Convert.ToInt32(dt.Rows[0][2]),
                    dt.Rows[0][3].ToString(), mark, Convert.ToInt32(dt.Rows[0][8]));
                return mr;
            }
            return null;
        }

        public static void updateStudent(User u)
        {
            string sql = @"UPDATE Student SET Fullname = @full , City = @city , gender = @gen , Phone = @ph , DOB = @dob WHERE ID = @id ";

            SqlParameter[] parameters = new SqlParameter[6];
            parameters[0] = new SqlParameter("@full", SqlDbType.NVarChar);
            parameters[1] = new SqlParameter("@city", SqlDbType.Int);
            parameters[2] = new SqlParameter("@gen", SqlDbType.Int);
            parameters[3] = new SqlParameter("@ph", SqlDbType.NVarChar);
            parameters[4] = new SqlParameter("@dob", SqlDbType.NVarChar);
            parameters[5] = new SqlParameter("@id", SqlDbType.Int);

            parameters[0].Value = u.fullname;
            parameters[1].Value = u.address;
            parameters[2].Value = u.gender;
            parameters[3].Value = u.phone;
            parameters[4].Value = u.dob;
            parameters[5].Value = u.id;
            runSqlWithParameter(sql, parameters);
        }

        public static DataTable getFeedBackbyStuid(int sid, int idterm)
        {
            string sql = @"select f.*, t.code , c.fullname, cl.name
                            from [Feedback] f
                            join Teacher t on t.id = f.idteacher
                            join Course c on c.ID = f.idcourse
                            join Class cl on cl.id = f.idclass
                            where f.idstudent = @sid and f.idterm = @tid";

            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = new SqlParameter("@sid", SqlDbType.Int);
            parameters[0].Value = sid;
            parameters[1] = new SqlParameter("@tid", SqlDbType.Int);
            parameters[1].Value = idterm;

            DataTable dt = GetDataBySqlWithParameter(sql, parameters);
            return dt;
        }

        public static FeddBack getFb(int fid)
        {
            string sql = @"select f.*, t.code , c.fullname, cl.name
                            from[Feedback] f
                           join Teacher t on t.id = f.idteacher
                            join Course c on c.ID = f.idcourse
                            join Class cl on cl.id = f.idclass
                            where f.id = @id";
            SqlParameter parameters = new SqlParameter();
            parameters = new SqlParameter("@id", SqlDbType.Int);
            parameters.Value = fid;

            DataTable dt = GetDataBySqlWithParameter(sql, parameters);
            
            FeddBack fb = new FeddBack(dt.Rows[0][12].ToString(), dt.Rows[0][2].ToString(), dt.Rows[0][10].ToString(), dt.Rows[0][11].ToString());
            return fb;
        }

        public static void updateFeedback(int id ,string content, string contentDes)
        {
            string sql = "update Feedback set content = @ct , contentDes = @cd where id = @id";
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@ct", SqlDbType.NVarChar);
            p[0].Value = content;
            p[1] = new SqlParameter("@cd", SqlDbType.NVarChar);
            p[1].Value = contentDes;
            p[2] = new SqlParameter("@id", SqlDbType.Int);
            p[2].Value = id;

            runSqlWithParameter(sql, p);
        }

        public static DataTable getAppType()
        {
            string sql = "select * from applicationtype";
            return GetDataBySqlWithParameter(sql);
        }

        public static void insertRequest(Registration r)
        {
            string sql = "insert into Registration([idtype],[purpose],[filename],[closeDate],[idstudent],[sendDate],[status])" +
                " values(@id, @pur, @file, @close, @idstu, @send,0)";
            SqlParameter[] p = new SqlParameter[6];
            p[0] = new SqlParameter("@id", SqlDbType.Int);
            p[0].Value = r.idtype;

            p[1] = new SqlParameter("@pur", SqlDbType.NVarChar);
            p[1].Value = r.purpose;

            p[2] = new SqlParameter("@close", SqlDbType.NVarChar);
            p[2].Value = "";

            p[3] = new SqlParameter("@idstu", SqlDbType.Int);
            p[3].Value = r.idstudent;

            p[4] = new SqlParameter("@file", SqlDbType.NVarChar);
            p[4].Value = r.filename;

            p[5] = new SqlParameter("@send", SqlDbType.NVarChar);
            p[5].Value = DateTime.Now.ToString("dd/MM/yyyy");

            runSqlWithParameter(sql, p);
        }

        public static void updatebalance(int id ,double money)
        {
            string sql = "update Student set balance = @bl where id = @id";
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@bl", SqlDbType.Float);
            p[0].Value = money;
            p[1] = new SqlParameter("@id", SqlDbType.Int);
            p[1].Value = id;
            runSqlWithParameter(sql, p);
        }

        public static DataTable getRequestBySid(int sid)
        {
            string sql = "select * from Registration where idstudent = @sid ";
            SqlParameter p = new SqlParameter("@sid", SqlDbType.Int);
            p.Value = sid;
            return GetDataBySqlWithParameter(sql, p);
        }

        public static int getCountRequest()
        {
            string sql = "select count(*) from Registration where [status] = 0";
            return Convert.ToInt32(GetDataBySqlWithParameter(sql).Rows[0][0]);
        }

        public static DataTable getTypeRequetbyStatus()
        {
            string sql = "select distinct a.id ,a.name from Registration r, applicationtype a where r.status = 0 and r.idtype = a.id";
            return GetDataBySqlWithParameter(sql);
        }

        public static DataTable getRequestbyStatusAndIDType(int id, int check)
        {
            string sql = "select  r.id, r.purpose, r.filename, r.sendDate" +
                " from Registration r, applicationtype a where [status] = 0  and r.idtype = a.id ";

            if(check == 1)
            {
                sql += "and a.id = @id";
                SqlParameter p = new SqlParameter("@id", SqlDbType.Int);

                p.Value = id;
                return GetDataBySqlWithParameter(sql, p);
            }
            else
            {
                return GetDataBySqlWithParameter(sql);
            }
            
        }

        public static void updateRegistation(Registration r)
        {
            string sql = "update Registration set PROCESSNOTE = @note, status = @status, closeDate = @date where id = @id";

            SqlParameter[] p = new SqlParameter[4];

            p[0] = new SqlParameter("@note", SqlDbType.NVarChar);
            p[1] = new SqlParameter("@status", SqlDbType.Int);
            p[2] = new SqlParameter("@date", SqlDbType.NVarChar);
            p[3] = new SqlParameter("@id", SqlDbType.Int);

            p[0].Value = r.processnote;
            p[1].Value = r.sta;
            p[2].Value = r.closeDate;
            p[3].Value = r.id;

            runSqlWithParameter(sql,p);
        }

        public static DataTable getClassbyTid(int tid)
        {
            string sql = "select id, name, idteacher, idterm, idstudent from class where idteacher = @tid ";
            SqlParameter p = new SqlParameter("@tid", SqlDbType.Int);
            p.Value = tid;
            return GetDataBySqlWithParameter(sql, p);
        }
        public static int[] getIDStudentbyCid(int cid)
        {
            string sql = "select idstudent from Class where id = @id";
            SqlParameter p = new SqlParameter("@id", SqlDbType.Int);
            p.Value = cid;
            DataTable dt = GetDataBySqlWithParameter(sql, p);
            string[] stu  = dt.Rows[0][0].ToString().Split(',');
            List<int> list = new List<int>();
            foreach (string item in stu)
            {
                list.Add(Convert.ToInt32(item));
            }

            return list.ToArray();
        }

        public static User getStudentById(int id)
        {
            string sql = "select RollNumber, Fullname, DOB from Student  where id = @id";
            SqlParameter p = new SqlParameter("@id", SqlDbType.Int);
            p.Value = id;
            DataTable dt = GetDataBySqlWithParameter(sql, p);
            User u = new User(dt.Rows[0][0].ToString(), dt.Rows[0][2].ToString(), dt.Rows[0][1].ToString());
            return u;
        }
    }
}