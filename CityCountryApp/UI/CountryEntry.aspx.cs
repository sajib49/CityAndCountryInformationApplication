using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryAndCityInformationApp.BLL;
using CountryAndCityInformationApp.MODEL;

namespace CountryAndCityInformationApp.UI
{
    public partial class CityEntry : System.Web.UI.Page
    {
        CountryManager aCountryManager = new CountryManager();
        protected void Page_Load(object sender, EventArgs e)
        {

           LoadCountryInGridView();

        }

        public void LoadCountryInGridView()
        {
            countryGridView.DataSource = aCountryManager.GetCountries();
            countryGridView.DataBind();
        }

        protected void countrySaveButton_Click(object sender, EventArgs e)
        {
            Country aCountry = new Country()
            {
                CountryName = Request.Form["countryName"],
                CountryAbout = Request.Form["editor1"]
            };

            string msg = aCountryManager.InsertCountryDetailed(aCountry);
            insertMessageShowLabel.Text = msg;
            LoadCountryInGridView();

        }

        protected void countryGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            countryGridView.PageIndex = e.NewPageIndex;
            LoadCountryInGridView();
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UI/Home.aspx");
        }
    }
}