using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using CityCountryApp.MODEL;
using CountryAndCityInformationApp.MODEL;

namespace CountryAndCityInformationApp.DAL
{

    public class CountryGateway
    {
        string connectionString = ConfigurationManager.ConnectionStrings["cityCountryApp"].ConnectionString;

        public int InsertCountry(Country aCountry)
        {
            SqlConnection aConnection = new SqlConnection(connectionString);
            string query = "INSERT INTO tbl_Country(CountryName,CountryAbout) VALUES(@countryName,@countryAbout)";
            aConnection.Open();
            SqlCommand aCommand = new SqlCommand();
            aCommand.Connection = aConnection;
            aCommand.CommandText = query;
            aCommand.Parameters.AddWithValue("@countryName", aCountry.CountryName);
            aCommand.Parameters.AddWithValue("@countryAbout", aCountry.CountryAbout);
            int rowEffect = aCommand.ExecuteNonQuery();
            aConnection.Close();
            return rowEffect;
      }

        public List<Country> GetCountries()
        {
            SqlConnection aConnection = new SqlConnection(connectionString);
            string query = "SELECT * FROM tbl_Country";
            SqlCommand aCommand = new SqlCommand(query, aConnection);
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();

            List<Country> countries = new List<Country>();
            while (aReader.Read())
            {
                Country aCountry = new Country()
                {
                    CountryId = Convert.ToInt32(aReader["CountryId"].ToString()),
                    CountryName = aReader["CountryName"].ToString(),
                    CountryAbout = aReader["CountryAbout"].ToString()
                    
                };
                countries.Add(aCountry);
            }

            return countries;
        }

        public List<CountryCity> GetALlCountries()
        {
            string getAllCountriesQuery = "SELECT * FROM CountryCityView";
            List<CountryCity> countries =  GetCountry(getAllCountriesQuery);
            return countries;
        }

        public List<CountryCity> GetCountriesByCountryName(string searchCountryName)
        {
            string getCountriesByCountryNameQuery = "SELECT * FROM CountryCityView WHERE CountryName LIKE '%" + searchCountryName + "%' ";
            List<CountryCity> countries = GetCountry(getCountriesByCountryNameQuery);
            return countries;
        }

        public List<CountryCity> GetCountry(string query)
        {
            SqlConnection aConnection = new SqlConnection(connectionString);
            
            //"SELECT tbl_Country.CountryName, tbl_Country.CountryAbout, COUNT(*)TotalCities, SUM(NoOfDewells)TotalDwellers FROM tbl_Country  JOIN tbl_City ON tbl_Country.id = tbl_City.CountryId GROUP BY CountryName,CountryAbout HAVING CountryName LIKE '%" + searchCountryName + "%'";
            //"SELECT tbl_Country.CountryName, tbl_Country.CountryAbout, COUNT(*)TotalCities, SUM(NoOfDewells)TotalDwellers FROM tbl_Country JOIN tbl_City ON tbl_Country.CountryId = tbl_City.CountryId GROUP BY CountryName, CountryAbout HAVING CountryName LIKE '%" + searchCountryName + "%'  ";
            SqlCommand aCommand = new SqlCommand(query, aConnection);
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();
            List<CountryCity> countryCities = new List<CountryCity>();
            while (aReader.Read())
            {
                CountryCity aCountryCity = new CountryCity()
                {
                    CountryName = aReader["CountryName"].ToString(),
                    CountryAbout = aReader["CountryAbout"].ToString(),
                    NoOfCities = Convert.ToInt32(aReader["TotalCities"].ToString()),
                    NoOfDwellers = Convert.ToInt32(aReader["TotalDwellers"].ToString())
                };
                countryCities.Add(aCountryCity);
            }
            aReader.Close();
            aConnection.Close();
            return countryCities;
        }
    }
}