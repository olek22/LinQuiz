<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="LinQuiz.AdminPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Panel administratora</title>

    <style>
        .col-sm {
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Witaj,
        <asp:Label ID="nazwaLabel" runat="server" Text="Label"></asp:Label>
    </h1>

    <div class="row mt-4">
        <div class="col-sm"><a class="btn btn-primary w-100 p-4" href="SlowkaList.aspx">Lista wszystkich słówek&nbsp;<i class="fas fa-list-ul"></i></a></div>
    </div>

    <div class="row mt-4" style="">
        <div class="col-sm"><a class="btn btn-warning w-100 p-2" href="KategorieEdit.aspx">Zarządzaj kategoriami&nbsp;<i class="fas fa-marker"></i></a></div>
        <div class="col-sm"><a class="btn btn-warning w-100 p-2" href="PoziomyEdit.aspx">Zarządzaj poziomami trudności&nbsp;<i class="fas fa-marker"></i></a></div>
        <div class="col-sm"><a class="btn btn-warning w-100 p-2" href="DefinicjeEdit.aspx">Zarządzaj definicjami&nbsp;<i class="fas fa-marker"></i></a></div>
        <div class="col-sm"><a class="btn btn-warning w-100 p-2" href="ZgloszeniaEdit.aspx">Zarządzaj zgłoszeniami&nbsp;<i class="fas fa-marker"></i></a></div>
    </div>
</asp:Content>
