using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fap_demo
{
    public class City
    {
        public int id { get; set; }
        public string Cityname { get; set; }

        public City(int id, string Cityname)
        {
            this.id = id;
            this.Cityname = Cityname;
        }
    }
}