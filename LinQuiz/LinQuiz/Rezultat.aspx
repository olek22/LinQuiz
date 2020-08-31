<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Rezultat.aspx.cs" Inherits="LinQuiz.Rezultat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Rezultat</title>

    <style>
        .col-sm {
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">
    <div class="card" style="padding: 30px">
        <div class="row mt-4">
            <h3>Rezultat</h3>
            <table class="table table-hover table-borderless">
                <tr>
                    <td>Zdobyte punkty doświadczenia:</td>
                    <td>
                        <asp:Label ID="doswiadczenieLabel" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td>Poprawne odpowiedzi:</td>
                    <td>
                        <asp:Label ID="poprawneLabel" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td>Liczba błędnych odpowiedzi:</td>
                    <td>
                        <asp:Label ID="bledneLabel" runat="server" Text="Label"></asp:Label></td>
                </tr>
            </table>
        </div>

        <div class="row mt-4">
            <div class="col-sm"><a class="btn btn-info pt-5 pb-5 w-100" href="Q1.aspx"><i class="fas fa-play"></i>&nbsp;Rozpocznij Quiz</a></div>
            <div class="col-sm"><a class="btn btn-info pt-5 pb-5 w-100" href="Ranking.aspx"><i class="fas fa-list-ol"></i>&nbsp;Ranking</a></div>
            <div class="col-sm"><a class="btn btn-info pt-5 pb-5 w-100" href="UserProfile.aspx"><i class="fas fa-user"></i>&nbsp;Profil</a></div>
        </div>
    </div>
</div>





</asp:Content>

