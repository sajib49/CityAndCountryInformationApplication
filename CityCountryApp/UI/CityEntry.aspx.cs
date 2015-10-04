using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CityCountryApp.BLL;
using CityCountryApp.MODEL;
using CountryAndCityInformationApp.BLL;
using CountryAndCityInformationApp.MODEL;

namespace CountryAndCityInformationApp.UI
{
    public partial class CountryEntry : System.Web.UI.Page
    {
        CountryManager aCountryManager = new CountryManager();
        CityManager aCityManager = new CityManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCountriesInDropDownList();
                LoadAllCityViews();
            }

        }

        public void LoadCountriesInDropDownList()
        {
            countryDropDownList.DataSource = aCountryManager.GetCountries();
            countryDropDownList.DataTextField = "CountryName";
            countryDropDownList.DataValueField = "CountryId";
            countryDropDownList.DataBind();
            ListItem li = new ListItem("Select Country", "-1");
            countryDropDownList.Items.Insert(0, li);
            
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void saveCityButton_Click(object sender, EventArgs e)
        {
            City aCity = new City();

            aCity.CityName = Request.Form["name"];
           // aCity.CityName = cityNameTextBox.Text;
            aCity.CityAbout = Request.Form["editor1"];
            aCity.NoOfDewells = int.Parse(Request.Form["noOfDwellers"]);
            //aCity.NoOfDewells = int.Parse(noOfDwellersTextBox.Text);
            aCity.Location = Request.Form["location"];
            //aCity.Location = locationTextBox.Text;
            aCity.Weather = Request.Form["editor2"];
            aCity.CountryId = Convert.ToInt32(countryDropDownList.SelectedItem.Value);
                
            
            string insertMessage = aCityManager.InsertCity(aCity);
            LoadAllCityViews();
            showCitySaveMessage.Text = insertMessage;
            
        }

        private void LoadAllCityViews()
        {
            cityListGridView.DataSource= aCityManager.GetCityViews();
            cityListGridView.DataBind();
        }

        protected void cityListGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            cityListGridView.PageIndex = e.NewPageIndex;
            LoadAllCityViews();
        }

        protected void cityListGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}