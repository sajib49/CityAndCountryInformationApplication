using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CityCountryApp.MODEL;
using CountryAndCityInformationApp.DAL;
using CountryAndCityInformationApp.MODEL;

namespace CountryAndCityInformationApp.BLL
{
    public class CountryManager
    {
        CountryGateway aCountryGateway = new CountryGateway();
        public string InsertCountryDetailed(Country aCountry)
        {
            int isSuccess = aCountryGateway.InsertCountry(aCountry);
            if (isSuccess>0)
            {
                return "Country has been successfully added.";
            }
            else
            {
                return "Sorry Country has not been added.";
            }
        }


        public List<Country> GetCountries()
        {
            return aCountryGateway.GetCountries();
        }

        public List<CountryCity> GetCountriesByCountryName(string searchCountryName)
        {
             List<CountryCity> countriesByCountryName = aCountryGateway.GetCountriesByCountryName(searchCountryName);
            return countriesByCountryName;
        }

        public List<CountryCity> GetCounteriesAndCities()
        {
            return aCountryGateway.GetALlCountries();
        } 
    }
}