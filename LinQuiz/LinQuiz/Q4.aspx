<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Q4.aspx.cs" Inherits="LinQuiz.Q4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- <div class="container">
        <div class="card">
            <asp:Label ID="wylosowaneLabe" runat="server" Text="Label"></asp:Label>
            <asp:TextBox ID="odpTextBo" runat="server"></asp:TextBox>
            <asp:Label ID="wybraneLabel" runat="server" Text="Label"></asp:Label>
            <asp:Button ID="sendButto" runat="server" OnClick="sendButton_Click" Text="Button" />
            <asp:Label ID="checkLabe" runat="server" Text="Label"></asp:Label>
        </div>
    </div> -->


    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card mt-5">
                    <div class="card-body">
                        <!-- Kategoria i Poziom Trudności -->
                        <div class="row">
                            <div class="col" align="left">
                                Poziom Trudności:
                        <asp:Label ID="PoziomTrudnosci" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="col" align="right">
                                Kategoria:
                       <asp:Label ID="Kategoria" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <p></p>
                            </div>
                        </div>
                        <!-- Wylosowane słowo -->
                        <div class="row">
                            <div class="col">
                                <center>
                             <h1>
                                <asp:Label ID="wylosowaneLabel" runat="server" Text="label"></asp:Label>
                             </h1>
                         </center>
                                <hr>
                            </div>
                        </div>
                        <!-- Odpowiedź -->
                        <div class="row">
                            <div class="col">
                                <center>
                                <asp:Label ID="checkLabel" runat="server" Text=""></asp:Label> 
                                <asp:Label ID="PoprawnaLabel" runat="server" Text=""></asp:Label>
                         </center>
                                <hr>
                            </div>
                        </div>

                        <!-- TextBox na odpowiedź -->
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Pole wymagane!" ControlToValidate="odpTextBox"></asp:RequiredFieldValidator>
                                    <asp:TextBox CssClass="form-control" ID="odpTextBox" runat="server" placeholder="Wpisz poprawną odpowiedź"></asp:TextBox>
                                </div>
                                <!-- Przycisk potwierdzający odpowiedź -->
                                <div class="form-group">
                                    <asp:Button class="btn btn-info btn-block btn-lg" ID="sendButton" runat="server" OnClick="sendButton_Click" Text="Potwierdź" />
                                    <asp:Button class="btn btn-warning btn-block btn-lg" ID="nastepneButton" runat="server" OnClick="nastepnaButton_Click" Text="Następne" Visible="false" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Powrót do strony głównej i następne pytanie -->
                <div class="row">
                    <div class="col" align="left">
                        <a class="nav-link" runat="server" href="Default.aspx" style="color: white"><i class="fas fa-home"></i>&nbsp;&nbsp;&nbsp;&nbsp;Wróć do strony głównej</a>
                    </div>
                    <div class="col" align="right">
                        <%--<i class="fa fa-cogs" ></i>&nbsp;--%><asp:Button ValidationGroup='valGroup1' class="btn btn-danger" ID="bladButton" runat="server" Text="Zgłoś błąd" OnClick="bladButton_Click" />
                        <asp:Label ID="bladLabel" runat="server" Text="Zgłoszenie wysłane!" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
