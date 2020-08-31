<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SlowkaList.aspx.cs" Inherits="LinQuiz.SlowkaList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Lista wszystkich słówek</title>

    <script type="text/javascript" charset="utf-8">  
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Lista wszystkich słówek</h1>

    <div class="row mt-4">
        <div class="col-sm">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT slowko.nazwa, definicja.tlumaczenie, kategoria.nazwa AS Expr1, poziomtrudnosci.nazwa AS Expr2 FROM definicja INNER JOIN slowko ON definicja.id = slowko.definicja_id INNER JOIN kategoria ON slowko.kategoria_id = kategoria.id INNER JOIN poziomtrudnosci ON slowko.poziomtrudnosci_id = poziomtrudnosci.id"></asp:SqlDataSource>
            <asp:GridView class="table table-hover table-borderless" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="nazwa" HeaderText="Słówko" SortExpression="nazwa" />
                    <asp:BoundField DataField="tlumaczenie" HeaderText="Tłumaczenie" SortExpression="tlumaczenie" />
                    <asp:BoundField DataField="Expr1" HeaderText="Kategoria" SortExpression="Expr1" />
                    <asp:BoundField DataField="Expr2" HeaderText="Poziom trudności" SortExpression="Expr2" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <div class="row mt-4" style="">
        <div class="col-sm"><a class="btn btn-warning w-100 p-2" href="SlowkaEdit.aspx">Zarządzaj słówkami&nbsp;<i class="fas fa-marker"></i></a></div>
        <div class="col-sm"><a class="btn btn-warning w-100 p-2" href="AdminPanel.aspx">Wróc do panelu administratora&nbsp;<i class="far fa-arrow-alt-circle-right"></i></a></div>
    </div>
</asp:Content>
