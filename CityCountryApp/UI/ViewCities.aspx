<%@ Page Title="" Language="C#" MasterPageFile="~/UI/MasterPage.Master" AutoEventWireup="true" CodeBehind="ViewCities.aspx.cs" Inherits="CountryAndCityInformationApp.UI.ViewCities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style10 {
            width: 43px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
    <h1 class="viewCities">View Cities</h1>
    <div class="horizontalLine"></div>
    <br />
    <div class="horizontalLine"></div>
    <br />
    <div class="box1">
        <h3>Search Critiria</h3>

        <table>
            <tr>

                <td class="auto-style1"><asp:RadioButton ID="r1" GroupName="sc" runat="server" /><b>City Name</b></td>

                <td>
                    <div class="form-group">
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="cityName" id="cityName" placeholder="Please Enter Your Country Name" />
                        </div>
                    </div>
                </td>
            </tr>

            <tr>
                <td class="auto-style1">
                   <asp:RadioButton ID="r2" GroupName="sc" runat="server" /> <b>Country Name</b>
                </td>

                <td>
                    <div class="form-group">
                        <div class="col-sm-10">
                            <asp:DropDownList ID="countryNameDropDownList" class="form-control" runat="server" Height="35px" Width="644px"></asp:DropDownList>
                        </div>

                    </div>

                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <asp:Button ID="searchButton" runat="server" class="btn btn-primary" Text="Search" Width="116px" OnClick="searchButton_Click" />
                </td>
            </tr>
        </table>

    </div>
    <br />

    <div class="box2">
        <h3>Country List</h3>
        <asp:GridView ID="countryCityListGridView" runat="server" sAutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" AllowPaging="True" PageSize="4"  OnPageIndexChanging="countryCityListGridView_PageIndexChanging" GridLines="None" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:TemplateField HeaderText="Serial No.">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CityName" HeaderText="City Name" HtmlEncode="False"/>
                <asp:BoundField DataField="CityAbout" HeaderText="CityAbout" HtmlEncode="False" />
                <asp:BoundField DataField="NoOfDwellers" HeaderText="No of Dwellers" />
                <asp:BoundField DataField="Location" HeaderText="Location" HtmlEncode="False" />
                <asp:BoundField DataField="Weather" HeaderText="Weather" HtmlEncode="False" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerSettings NextPageText="Next" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
    </div>
</asp:Content>
