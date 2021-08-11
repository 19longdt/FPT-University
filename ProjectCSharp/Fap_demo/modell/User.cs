using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Fap_demo
{
    public class User
    {
        public int id { get; set; }
        public string code { get; set; }
        public string dob { get; set; }
        public int address { get; set; }
        public string phone { get; set; }
        public string mail { get; set; }
        public string major { get; set; }

        public string username { get; set; }
        public string password { get; set; }
        public string fullname { get; set; }

        public int gender { get; set; }
        public string img { get; set; }

        public int classid { get; set; }
        public double balance { get; set; }
        public int role { get; set; }
        public User()
        {
        }

        public User(string username, string password)
        {
            this.username = username;
            this.password = password;
        }

        public User(string code, string dob, string fullname)
        {
            this.fullname = fullname;
            this.code = code;
            this.dob = dob;
        }

        public User(string username, string password, int role)
        {
            this.username = username;
            this.password = password;
            this.role = role;
        }

        public User(int id, string code, string fullname, int classid, int role)
        {
            this.id = id;
            this.code = code;
            this.fullname = fullname;
            this.classid = classid;
            this.role = role;
        }

        public User(int id, string fullname, string dob, int city, int gender, string phone)
        {
            this.id = id;
            this.phone = phone;
            this.fullname = fullname;
            this.address = city;
            this.gender = gender;
            this.dob = dob;
        }

        public User(int id, string code, string dob, int address, string phone, string mail, string major, string fullname)
        {
            this.id = id;
            this.code = code;
            this.dob = dob;
            this.address = address;
            this.phone = phone;
            this.mail = mail;
            this.major = major;
            this.fullname = fullname;
        }

        public User(int id, string code, string dob, int address, string phone, string mail, string major, string fullname, int gender, string img, double balaa) : this(id, code, dob, address, phone, mail, major, fullname)
        {
            this.gender = gender;
            this.img = img;
            this.balance = balaa;
        }
    }
    //class UserList
    //{
    //    public static User GetStudentbyid(int id)
    //    {
    //        List<User> List = new List<User>();
    //        User u = DAO.getStudentById(id);



    //        return List;
    //    }
    //}
}