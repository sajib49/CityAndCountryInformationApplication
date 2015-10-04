using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using CityCountryApp.MODEL;

namespace CityCountryApp.DAL
{
    public class CityGateway
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["cityCountryApp"].ConnectionString;
        
        public int InsertCity(City aCity)
        {
            SqlConnection aConnection = new SqlConnection(connectionString);
            string query = "INSERT INTO tbl_City VALUES(@cityName,@cityAbout,@noOfDewells,@location,@weather,@countryId)";
            aConnection.Open();
            SqlCommand aCommand = new SqlCommand();
            aCommand.Connection = aConnection;
            aCommand.CommandText = query;
            aCommand.Parameters.AddWithValue("@cityName", aCity.CityName);
            aCommand.Parameters.AddWithValue("@cityAbout", aCity.CityAbout);
            aCommand.Parameters.AddWithValue("@noOfDewells", aCity.NoOfDewells);
            aCommand.Parameters.AddWithValue("@location", aCity.Location);
            aCommand.Parameters.AddWithValue("@weather", aCity.Weather);
            aCommand.Parameters.AddWithValue("@countryId", aCity.CountryId);
            int rowEffect = aCommand.ExecuteNonQuery();
            aConnection.Close();
            return rowEffect;

        }

        public List<CityView> GetCityViews()
        {
            SqlConnection aConnection = new SqlConnection(connectionString);
            string query = "SELECT * FROM CityView";
            SqlCommand aCommand = new SqlCommand(query,aConnection);
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();
            List<CityView> cityViews = new List<CityView>();
            
            while (aReader.Read())
            {
                CityView aCityView = new CityView()
                {
                    CityName = aReader["CityName"].ToString(),
                    CountryName = aReader["CountryName"].ToString(),
                    NoOfDewells = Convert.ToInt32(aReader["NoOfDewells"].ToString())
                };
                cityViews.Add(aCityView);
            }
            aConnection.Close();
            aReader.Close();
            return cityViews;
        }

        public List<CountryCity> GetAllCountriesCities()
        {
            string query = "SELECT tbl_City.CityName,tbl_City.CityAbout,tbl_City.NoOfDewells,tbl_City.Location,tbl_City.Weather, tbl_Country.CountryName,tbl_Country.CountryAbout FROM tbl_City LEFT OUTER JOIN tbl_Country ON tbl_City.CountryId = tbl_Country.CountryId";
            List<CountryCity> countriesCities=  GetCountryCity(query);
            return countriesCities;
        }


        public List<CountryCity> SearchCountriesCitiesByCityName(string searchCityName)
        {
            string query = "SELECT tbl_City.CityName,tbl_City.CityAbout,tbl_City.NoOfDewells,tbl_City.Location,tbl_City.Weather, tbl_Country.CountryName,tbl_Country.CountryAbout FROM tbl_City LEFT OUTER JOIN tbl_Country ON tbl_City.CountryId = tbl_Country.CountryId WHERE CityName LIKE '%" + searchCityName + "%' ";
            List<CountryCity> countriesCities = GetCountryCity(query);
            return countriesCities;
        }

        public List<CountryCity> SearchCountriesCitiesByCountryName(string searchCountryName)
        {
            string query = "SELECT tbl_City.CityName,tbl_City.CityAbout,tbl_City.NoOfDewells,tbl_City.Location,tbl_City.Weather, tbl_Country.CountryName,tbl_Country.CountryAbout FROM tbl_City LEFT OUTER JOIN tbl_Country ON tbl_City.CountryId = tbl_Country.CountryId WHERE CountryName LIKE '%" + searchCountryName + "%' ";
            List<CountryCity> countriesCities = GetCountryCity(query);
            return countriesCities;
        }

        public List<CountryCity> GetCountryCity(string query)
        {
            SqlConnection aConnection = new SqlConnection(connectionString);
            SqlCommand aCommand = new SqlCommand(query, aConnection);
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();
            List<CountryCity> countriesCities = new List<CountryCity>();

            while (aReader.Read())
            {
                CountryCity aCountryCity = new CountryCity()
                {
                    CityName = aReader["CityName"].ToString(),
                    CityAbout = aReader["CityABout"].ToString(),
                    Location = aReader["Location"].ToString(),
                    Weather = aReader["Weather"].ToString(),
                    NoOfDwellers = Convert.ToInt32(aReader["NoOfDewells"].ToString()),
                    CountryName = aReader["CountryName"].ToString(),
                    CountryAbout = aReader["CountryAbout"].ToString()

                };
                countriesCities.Add(aCountryCity);
            }

            return countriesCities;
        }


    }
}