using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CityCountryApp.MODEL
{
    public class CountryCity
    {
        public string CityName { get; set; }
        public string CityAbout { get; set; }
        public string Location { get; set; }
        public string Weather { get; set; }

        public string CountryName { get; set; }
        public string CountryAbout { get; set; }
        public int? NoOfCities { get; set; }
        public int? NoOfDwellers { get; set; }
    }
}