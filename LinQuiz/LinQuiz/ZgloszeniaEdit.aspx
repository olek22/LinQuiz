<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ZgloszeniaEdit.aspx.cs" Inherits="LinQuiz.ZgloszeniaEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Zarządzaj zgłoszeniami</title>

    <script type="text/javascript" charset="utf-8">  
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Zarządzaj zgłoszeniami</h1>

    <div class="row mt-4">
        <div class="col-sm">
            <asp:GridView class="table table-hover table-borderless" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="uzytkownik" HeaderText="uzytkownik" SortExpression="uzytkownik" />
                    <asp:BoundField DataField="slowko" HeaderText="slowko" SortExpression="slowko" />
                    <asp:BoundField DataField="data_zgloszenia" HeaderText="data_zgloszenia" SortExpression="data_zgloszenia" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" DeleteCommand="DELETE FROM [zgloszenie] WHERE [id] = @id" InsertCommand="INSERT INTO [zgloszenie] ([uzytkownik], [slowko], [data_zgloszenia]) VALUES (@uzytkownik, @slowko, @data_zgloszenia)" ProviderName="<%$ ConnectionStrings:con.ProviderName %>" SelectCommand="SELECT [id], [uzytkownik], [slowko], [data_zgloszenia] FROM [zgloszenie]" UpdateCommand="UPDATE [zgloszenie] SET [uzytkownik] = @uzytkownik, [slowko] = @slowko, [data_zgloszenia] = @data_zgloszenia WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="uzytkownik" Type="String" />
                    <asp:Parameter Name="slowko" Type="String" />
                    <asp:Parameter Name="data_zgloszenia" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="uzytkownik" Type="String" />
                    <asp:Parameter Name="slowko" Type="String" />
                    <asp:Parameter Name="data_zgloszenia" Type="DateTime" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-sm"><a class="btn btn-warning w-100 p-2" href="AdminPanel.aspx"><i class="far fa-arrow-alt-circle-left"></i>&nbsp;Wróc do panelu administratora</a></div>
    </div>
</asp:Content>
