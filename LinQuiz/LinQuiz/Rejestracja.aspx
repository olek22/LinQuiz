<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Rejestracja.aspx.cs" Inherits="LinQuiz.Rejestracja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container">
      <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="imgs/generaluser.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                         <center>
                        <p>Rejestracja</p>
                         </center>
                         <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <span class="badge badge-pill badge-info">Dane logowania</span>
                        </center>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col">
                        <label>Podaj nazwę użytkowika&nbsp;&nbsp; </label>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Nazwa jest wymagana" style="text-align:right; COLOR: red"></asp:RequiredFieldValidator>
&nbsp;<asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="Podaj nazwę"></asp:TextBox>
                     </div>
                   </div>
                   <div class="row">
                     <div class="col">
                        <label>Hasło&nbsp; </label>&nbsp;&nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox8" ErrorMessage="Hasło jest wymagane" style="COLOR: red"></asp:RequiredFieldValidator>
&nbsp;<asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="Podaj hasło"></asp:TextBox>
                     </div>
                    </div>
                   <div class="row">
                     <div class="col">
                        <label>Powtórz hasło</label>&nbsp;&nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox9" ErrorMessage="Powtórzenie hasła jest wymagane" style="COLOR: red"></asp:RequiredFieldValidator>
&nbsp;<div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="Powtórz hasło" TextMode="Password"></asp:TextBox>
                        </div>
                     </div>
                       </div>
                   <div class="row">
                     <div class="col">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox8" ControlToValidate="TextBox9" ErrorMessage="Hasła  nie są zgodne" style="COLOR: red"></asp:CompareValidator>
                     </div>
                </div>
                   <p></p>
                  <div class="row">
                     <div class="col">
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Stwórz konto" OnClick="Button1_Click" />
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a class="nav-link" runat=server href="Default.aspx" style="COLOR: white"><i class="fas fa-home"></i>&nbsp;&nbsp;&nbsp;&nbsp;Wróć do strony głównej</a>
            </div>
      </div>
   </div>
</asp:Content>
