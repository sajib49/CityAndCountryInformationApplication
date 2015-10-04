<%@ Page Title="" Language="C#" MasterPageFile="~/UI/MasterPage.Master" AutoEventWireup="true" CodeBehind="CityEntry.aspx.cs" Inherits="CountryAndCityInformationApp.UI.CountryEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 805px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
    <h1 style="color: white">City Entry</h1>
    <div class="horizontalLine"></div>
    <br />
    <div class="horizontalLine"></div>
    <br />

    <div class="cityEntry">
        <table>
            <tr>
                <td>

                    <asp:Label ID="Label1" runat="server" Text="City Name"></asp:Label>
                </td>
                <td class="auto-style1">
                    <div class="form-group">
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="name" id="name" placeholder="Type your Name" />
                        </div>
                    </div>
                    <%--<asp:TextBox ID="cityNameTextBox" runat="server" Height="25px" Width="804px"></asp:TextBox>--%>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="City About"></asp:Label></td>
                <td class="auto-style1">
                    <textarea name="editor1" id="editor1" rows="10" placeholder="Please Write Anything CountryAbout Your CountryCityCountryId...">
             
            </textarea>

                </td>
            </tr>

            <tr>
                <td>No of Dewells&nbsp;&nbsp;&nbsp; </td>
                <td class="auto-style1">
                    <div class="form-group">
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="noOfDwellers" id="noOfDwellers" placeholder="Number of Dwellers" />
                        </div>
                    </div>
                    <%--<asp:TextBox ID="noOfDwellersTextBox" Height="25px" Width="804px" runat="server"></asp:TextBox>--%>

                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Location"></asp:Label></td>
                <td class="auto-style1">
                    <div class="form-group">
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="location" id="location" placeholder="Location" />
                        </div>
                    </div>

                    <%--<asp:TextBox ID="locationTextBox" runat="server" Height="25px" Width="804px"></asp:TextBox>--%>

                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Weather"></asp:Label>
                </td>
                <td class="auto-style1">
                    <textarea name="editor2" id="editor2" rows="10" cols="80" placeholder="Please Write Anything CountryAbout Your CountryCityCountryId...">
             
            </textarea></td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Country"></asp:Label></td>
                <td class="auto-style1">
                    <div class="form-group">
                        <div class="col-sm-10">
                            <asp:DropDownList ID="countryDropDownList" runat="server"  Height="34px" Width="810px"></asp:DropDownList>
                        </div>
                    </div>


                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br/>
                    <asp:Button ID="saveCityButton" runat="server" class="btn btn-success" Text="Save" Width="92px" OnClick="saveCityButton_Click" />&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="cancelButton"  runat="server" class="btn btn-danger" Text="Cancel" OnClick="cancelButton_Click" Width="89px" />
                </td>
             
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="showCitySaveMessage" runat="server"></asp:Label></td>
            </tr>
        </table>
    </div>
    <div class="clear"></div>
    <h1 style="color: white">City List</h1>
    <div class="horizontalLine"></div>
    <br />
    <div class="horizontalLine"></div>
    <br />
    <div class="cityList">
        <asp:GridView ID="cityListGridView" runat="server" AutoGenerateColumns="False" Height="166px" Style="margin-left: 69px" Width="773px" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" PageSize="5" AllowPaging="True" OnPageIndexChanging="cityListGridView_PageIndexChanging" OnSelectedIndexChanged="cityListGridView_SelectedIndexChanged" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:TemplateField HeaderText="Serial No.">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CityName" HeaderText="City Name" HtmlEncode="False" />
                <asp:BoundField DataField="NoOfDewells" HeaderText="Dwellers" HtmlEncode="False" />
                <asp:BoundField DataField="CountryName" HeaderText="Country" HtmlEncode="False" />
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
