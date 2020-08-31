<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="LinQuiz.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Profil</title>

    <style>
        .col-sm {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="margin-bottom: 1em">Witaj,
        <asp:Label ID="nazwaLabel" runat="server" Text="Label"></asp:Label>
    </h1>

    <div class="row mt-4">
        <h3>Twoje statystyki</h3>

        <table class="table table-hover table-borderless">
            <tr>
                <td>Punkty doświadczenia:</td>
                <td>
                    <asp:Label ID="doswLabel" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>Liczba poprawnych odpowiedzi:</td>
                <td>
                    <asp:Label ID="poprLabel" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>Liczba błędnych odpowiedzi:</td>
                <td>
                    <asp:Label ID="bledneLabel" runat="server" Text="Label"></asp:Label></td>
            </tr>
        </table>
    </div>

    <div class="row mt-4">
        <div class="col-sm"><a class="btn btn-primary pt-5 pb-5 w-100" href="StartQuiz.aspx"><i class="fas fa-play"></i>&nbsp;Rozpocznij Quiz</a></div>
        <div class="col-sm"><a class="btn btn-primary pt-5 pb-5 w-100" href="Ranking.aspx"><i class="fas fa-list-ol"></i>&nbsp;Ranking</a></div>
    </div>

    <div class="row mt-4">
        <asp:Label for="hasloTextBox" ID="hasloLabel" runat="server" Text="Podaj nowe hasło:"></asp:Label>
        &nbsp;<asp:RequiredFieldValidator ValidationGroup='valGroup1' ID="RequiredFieldValidator2" runat="server" ControlToValidate="hasloTextBox" ErrorMessage="Pole wymagane!"></asp:RequiredFieldValidator>
        <asp:TextBox class="form-control" ID="hasloTextBox" runat="server"></asp:TextBox>

        <asp:Button ValidationGroup='valGroup1' class="btn btn-primary" ID="zmienButton" runat="server" Text="Zmień hasło" OnClick="zmienButton_Click" />
    </div>
</asp:Content>
