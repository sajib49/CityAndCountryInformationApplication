using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CityCountryApp.MODEL
{
    public class City
    {
        public int CityId { get; set; }
        public string CityName { get; set; }
        public string CityAbout { get; set; }
        public int NoOfDewells { get; set; }
        public string Location { get; set; }
        public string Weather { get; set; }
        public int CountryId { get; set; }
    }
}