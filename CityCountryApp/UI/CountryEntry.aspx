<%@ Page Title="" Language="C#" MasterPageFile="~/UI/MasterPage.Master" AutoEventWireup="true" CodeBehind="CountryEntry.aspx.cs" Inherits="CountryAndCityInformationApp.UI.CityEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
    <h1 style="color: white">Country Entry</h1>
    <div style="background-color: gray; padding: 10px; border-radius: 5px;">

        <table>
            <tr>
                <td><b>Country Name: </b></td>
                <td>
                    <div class="form-group">
                        <div class="col-sm-10">
                               <input type="text" class="form-control" name="countryName" id="countryName" placeholder="Please Enter Your Country Name" />
                        </div>
                    </div>
                    <%--<asp:TextBox ID="countryNameTextBox" runat="server" Height="25px" Width="804px"></asp:TextBox>--%>
                </td>
            </tr>

            <tr>
                <td><b>CountryAbout: </b></td>
                <td>
                    &nbsp;<textarea name="editor1" id="editor1" rows="10" placeholder="Please Write Anything CountryAbout Your CountryCityCountryId...">
             
            </textarea></td>
            </tr>
        </table>

        <asp:Button ID="countrySaveButton" class="btn btn-success" runat="server" Text="Save" Width="89px" OnClientClick="return CheckValidation()" OnClick="countrySaveButton_Click" />
        &nbsp;&nbsp;&nbsp;  
          
        <asp:Button runat="server" ID="cancelButton" class="btn btn-danger" Text="Cancel" Width="80px" OnClick="cancelButton_Click" Height="33px" />
        <asp:Label ID="insertMessageShowLabel" runat="server"></asp:Label>

    </div>
    <h1 style="color: white">Country List</h1>
    <div style="background-color: gray; padding: 10px; border-radius: 5px; height: auto;">
        <asp:GridView ID="countryGridView" AllowPaging="True" PageSize="3" runat="server" AutoGenerateColumns="False" Width="100%" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnPageIndexChanging="countryGridView_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="Serial No.">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CountryName" HeaderText="Country Name" HtmlEncode="False" />
                <asp:BoundField DataField="CountryAbout" HeaderText="CountryAbout" HtmlEncode="False" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    </div>
</asp:Content>
