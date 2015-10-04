using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CityCountryApp.DAL;
using CityCountryApp.MODEL;

namespace CityCountryApp.BLL
{
    public class CityManager
    {
        CityGateway aCityGateway = new CityGateway();
        public string InsertCity(City aCity)
        {
            int isSuccess= aCityGateway.InsertCity(aCity);
            if (isSuccess>0)
            {
                return "City has successfully insert.";
            }
            else
            {
                return "Sorry city has not been insert sucessfully.";
            }
        }

        public List<CityView> GetCityViews()
        {
            return aCityGateway.GetCityViews();
        }

        public List<CountryCity> GetCountriesCities()
        {
            return aCityGateway.GetAllCountriesCities();
        }

        public List<CountryCity> SearchCountriesCitiesByCityName(string searchCityName)
        {
            return aCityGateway.SearchCountriesCitiesByCityName(searchCityName);
        }

        public List<CountryCity> SearchCountriesCitiesByCountryName(string searchCountryName)
        {
            return aCityGateway.SearchCountriesCitiesByCountryName(searchCountryName);
        }
    }
}