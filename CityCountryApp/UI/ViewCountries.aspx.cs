using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryAndCityInformationApp.BLL;

namespace CountryAndCityInformationApp.UI
{
    public partial class ViewCountries : System.Web.UI.Page
    {
        CountryManager aCountryManager = new CountryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCountriesInGridView();
            }
        }

        public void LoadCountriesInGridView()
        {
            searchCountryGridView.DataSource = aCountryManager.GetCounteriesAndCities();
            searchCountryGridView.DataBind();
        }

        protected void searchCountryButton_Click(object sender, EventArgs e)
        {
            string searchCountryName = searchCountryNameTextBox.Text;
            if (searchCountryName!= "")
            {
                searchCountryGridView.DataSource = aCountryManager.GetCountriesByCountryName(searchCountryName);
                searchCountryGridView.DataBind();
            }

        }




        protected void searchCountryGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            searchCountryGridView.PageIndex = e.NewPageIndex;
            LoadCountriesInGridView();

        }

        protected void searchCountryGridView_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }
    }
}