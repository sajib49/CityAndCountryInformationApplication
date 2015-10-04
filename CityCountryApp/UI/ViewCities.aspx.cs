using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CityCountryApp.BLL;
using CountryAndCityInformationApp.BLL;

namespace CountryAndCityInformationApp.UI
{
    public partial class ViewCities : System.Web.UI.Page
    {
        CountryManager aCountryManager = new CountryManager();
        CityManager aCityManager = new CityManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCountriesInDropDownList();
                LoadCountriesCitiesInGridView();
            }
            
        }

        public void LoadCountriesInDropDownList()
        {
            countryNameDropDownList.DataSource = aCountryManager.GetCountries();
            countryNameDropDownList.DataTextField = "CountryName";
            countryNameDropDownList.DataValueField = "CountryId";
            countryNameDropDownList.DataBind();
            ListItem li = new ListItem("Select Country", "-1");
            countryNameDropDownList.Items.Insert(0, li);

        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            if (r1.Checked)
            {
                string searchCityName = Request.Form["cityName"];
                countryCityListGridView.DataSource = aCityManager.SearchCountriesCitiesByCityName(searchCityName);
                countryCityListGridView.DataBind();

            }

            else if (r2.Checked)
             {
                 string searchCountryName = countryNameDropDownList.SelectedItem.Text;
                countryCityListGridView.DataSource = aCityManager.SearchCountriesCitiesByCountryName(searchCountryName);
                countryCityListGridView.DataBind();
            }
            else
            {
                LoadCountriesCitiesInGridView();
            }
        }

        public void LoadCountriesCitiesInGridView()
        {
            countryCityListGridView.DataSource = aCityManager.GetCountriesCities();
            countryCityListGridView.DataBind();
        }

        protected void countryCityListGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            countryCityListGridView.PageIndex = e.NewPageIndex;
            LoadCountriesCitiesInGridView();
        }
    }
}