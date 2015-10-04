<%@ Page Title="" Language="C#" MasterPageFile="~/UI/MasterPage.Master" AutoEventWireup="true" CodeBehind="ViewCountries.aspx.cs" Inherits="CountryAndCityInformationApp.UI.ViewCountries" EnableViewState="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
    <div class="searchCritiria">
        <h3>Search Critiria</h3>
        <table>
            <tr>
                <td><b>Country Name</b></td>
                <td>
                    <asp:TextBox ID="searchCountryNameTextBox" runat="server" Height="25px" Width="804px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="searchCountryButton" runat="server" class="btn btn-primary" Text="Search" Width="151px" Height="36px" OnClick="searchCountryButton_Click" /></td>
            </tr>
        </table>
    </div>

    <div class="clear"></div>
    <div class="searchCountry">
        <asp:GridView CssClass="searchCountryGridView" ID="searchCountryGridView"  runat="server" AutoGenerateColumns="False" Height="133px" Width="939px" AllowPaging="True" PageSize="3" OnSelectedIndexChanging="searchCountryGridView_SelectedIndexChanging" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" OnPageIndexChanging="searchCountryGridView_PageIndexChanging" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:TemplateField HeaderText="Serial No.">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Country Name" DataField="CountryName" HtmlEncode="False"/>
                <asp:BoundField HeaderText="CountryAbout" DataField="CountryAbout" HtmlEncode="False"/>
                <asp:BoundField HeaderText="No. Of Cities" DataField="NoOfCities"/>
                <asp:BoundField HeaderText="No of City Dwellers" DataField="NoOfDwellers"/>
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
    </div>
</asp:Content>
