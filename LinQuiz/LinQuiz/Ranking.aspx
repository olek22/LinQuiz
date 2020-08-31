<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Ranking.aspx.cs" Inherits="LinQuiz.Ranking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Ranking</title>

    <script type="text/javascript" charset="utf-8">  
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="margin-bottom: 1em">Ranking</h1>

    <p style="margin-bottom: 1em">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT uzytkownik.nazwa, statystyki.ilosc_doswiadczenia, statystyki.poprawne_odp, statystyki.bledne_odp FROM statystyki INNER JOIN uzytkownik ON statystyki.id = uzytkownik.statystyki_id"></asp:SqlDataSource>
        <asp:GridView class="table table-hover table-borderless" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="nazwa" HeaderText="Nazwa" SortExpression="nazwa" />
                <asp:BoundField DataField="ilosc_doswiadczenia" HeaderText="Doświadczenie" SortExpression="ilosc_doswiadczenia" />
                <asp:BoundField DataField="poprawne_odp" HeaderText="Poprawne odp." SortExpression="poprawne_odp" />
                <asp:BoundField DataField="bledne_odp" HeaderText="Błędne odp." SortExpression="bledne_odp" />
            </Columns>
        </asp:GridView>
    </p>
</asp:Content>
